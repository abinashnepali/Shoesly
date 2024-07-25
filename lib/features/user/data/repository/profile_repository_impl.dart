import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:shoesly/core/data/firebase/api_response.dart';
import 'package:shoesly/core/data/firebase/firebase_exception_mapper.dart';
import 'package:shoesly/core/data/firebase/firebase_services.dart';
import 'package:shoesly/core/data/firebase/network_exception.dart';
import 'package:shoesly/core/data/firebase/network_info.dart';
import 'package:shoesly/core/presentation/widgets/toast.dart';
import 'package:shoesly/core/utils/constants.dart';
import 'package:shoesly/core/utils/constants_message.dart';
import 'package:shoesly/features/user/data/model/usermodel.dart';
import 'package:shoesly/features/user/data/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final NetworkInfo networkInfo;

  ProfileRepositoryImpl({required this.networkInfo});

  @override
  Future<ApiResponse> getUserDetails(String uID) async {
    if (await networkInfo.isConnected) {
      if (!await isAuthenticated()) {
        return ApiResponse(error: ConstantsMessage.nouserDataAvailable);
      }
      try {
        final usercollection =
            FirebaseService.firestore.collection(Constants.userinfo);
        final userDoc = await usercollection.doc(uID).get();
        if (!userDoc.exists) {
          return ApiResponse(error: ConstantsMessage.nouserDataAvailable);
        }

        final userData = Usermodel.fromJson(userDoc.data()!);

        return ApiResponse(data: userData);
      } //
      on FirebaseException catch (e) {
        final exception = FirebaseExceptionMapper.mapFirebaseException(e);
        return ApiResponse(error: exception.code);
      } //
      catch (e) {
        String errorMsg = NetworkException.getErrorMessage(
            NetworkException.noInternetConnection());

        return ApiResponse(error: errorMsg);
      }
    } //
    else {
      return ApiResponse(
          error: NetworkException.getErrorMessage(
              NetworkException.unexpectedError()));
    }
  }

  Future<bool> isAuthenticated() async {
    final user = FirebaseService.firebaseAuth.currentUser;
    return user != null;
  }

  @override
  Future<ApiResponse> updateProfile(Usermodel userinfo,
      {Uint8List? imageFile}) async //
  {
    if (await networkInfo.isConnected) {
      try {
        String fileName = '';

        if (userinfo.photoFile != null && userinfo.photoFile != '') {
          fileName = DateTime.now().millisecondsSinceEpoch.toString();

          String? imageUrl =
              await uploadImage(userinfo.photoFile!, imageUint: imageFile);
          if (imageUrl != null) {
            userinfo.photoURL = imageUrl;
          }
        }
        final usercollection =
            FirebaseService.firestore.collection(Constants.userinfo);
        final userDoc = usercollection.doc(FirebaseService.userinfo!.uid);

        await userDoc.update(userinfo.toJson());

        return ApiResponse(data: userinfo);
      } //
      on FirebaseException catch (e) {
        final exception = FirebaseExceptionMapper.mapFirebaseException(e);
        return ApiResponse(error: exception.code);
      } //
      catch (e) {
        // String errorMsg = NetworkException.getErrorMessage(
        //     NetworkException.noInternetConnection());

        return ApiResponse(error: e.toString());
      }
    } //
    else {
      return ApiResponse(
          error: NetworkException.getErrorMessage(
              NetworkException.unexpectedError()));
    }
  }

  @override
  Future<String?> uploadImage(File image, {Uint8List? imageUint}) async {
    try {
      if (!image.existsSync()) {
        throw Exception("File does not exist");
      }

      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final ref =
          FirebaseService.firebaseStorage.ref().child('images/users/$fileName');
      //final uploadTask = ref.putFile(image);
      final uploadTask = ref.putData(imageUint!);

      final snapshot = await uploadTask;

      if (snapshot.state == TaskState.success) {
        final downloadUrl = await snapshot.ref.getDownloadURL();
        print("Image uploaded successfully. Download URL: $downloadUrl");
        return downloadUrl;
      } else {
        throw Exception("Upload failed: ${snapshot.state}");
      }

      // final snapshot = await uploadTask.whenComplete(() => null);
      // final downloadUrl = await snapshot.ref.getDownloadURL();
      // return downloadUrl;
    } on FirebaseException catch (e) {
      final exception = FirebaseExceptionMapper.mapFirebaseException(e);

      showFailureToast(exception.code);
    } //
    catch (e) {
      showFailureToast(e.toString());
    }
    return null;
  }
}
