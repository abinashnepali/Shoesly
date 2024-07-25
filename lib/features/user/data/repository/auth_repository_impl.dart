import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shoesly/core/data/firebase/api_response.dart';
import 'package:shoesly/core/data/firebase/firebase_exception_mapper.dart';
import 'package:shoesly/core/data/firebase/firebase_services.dart';
import 'package:shoesly/core/data/firebase/network_exception.dart';
import 'package:shoesly/core/data/firebase/network_info.dart';
import 'package:shoesly/core/presentation/routes/app_routes.dart';
import 'package:shoesly/core/presentation/widgets/toast.dart';
import 'package:shoesly/core/utils/constants.dart';
import 'package:shoesly/core/utils/pref_utils.dart';
import 'package:shoesly/features/user/data/model/usermodel.dart';
import 'package:shoesly/features/user/data/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final PrefUtils prefUtils;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({required this.prefUtils, required this.networkInfo});

  @override
  Future<bool> isAuthenticated() async {
    // final accessToken = prefUtils.getString(Constants.acessToken);
    // return accessToken != null;
    final user = FirebaseService.firebaseAuth.currentUser;
    return user != null;
  }

  @override
  Future<void> logout() async {
    if (await networkInfo.isConnected) {
      try {
        await FirebaseService.firebaseAuth.signOut();
        await prefUtils.removePref(Constants.acessToken);
        Get.toNamed(Routes.homeTabContainer);
        showToast('Logout Sucessfull');
      } //
      on FirebaseException catch (e) {
        final exception = FirebaseExceptionMapper.mapFirebaseException(e);
        showToast(exception.code.toString());
      } //
      catch (e) {
        String errorMsg = NetworkException.getErrorMessage(
            NetworkException.noInternetConnection());
        showToast(errorMsg);
      }
    } //
    else {
      ApiResponse(
          error: NetworkException.getErrorMessage(
              NetworkException.unexpectedError()));
    }
  }

//Login Code
  @override
  Future<ApiResponse> siginWithEmailFirebase(Usermodel params) async {
    if (await networkInfo.isConnected) {
      try {
        final UserCredential userCredential = await FirebaseService.firebaseAuth
            .signInWithEmailAndPassword(
                email: params.email!, password: params.password!);
        // userCredential.credential!.accessToken;
        prefUtils.setString(
            Constants.acessToken, userCredential.credential.toString());

        return ApiResponse(data: userCredential);
      } on FirebaseException catch (e) {
        final exception = FirebaseExceptionMapper.mapFirebaseException(e);
        return ApiResponse(error: exception.code);
      } //
      catch (e) {
        return ApiResponse(
            error: NetworkException.getErrorMessage(
                NetworkException.unexpectedError()));
      }
    } //
    else {
      return ApiResponse(
          error: NetworkException.getErrorMessage(
              NetworkException.noInternetConnection()));
    }
  }

  // Register

  @override
  Future<ApiResponse> signUPWithFirebase(Usermodel params) async {
    if (await networkInfo.isConnected) {
      try {
        if (params.email != null && params.password != null) {
          final UserCredential userCredential =
              await FirebaseService.firebaseAuth.createUserWithEmailAndPassword(
                  email: params.email!, password: params.password!);

          if (userCredential.user != null) {
            final usercollection = FirebaseService.firestore
                .collection(Constants.userinfo)
                .doc(userCredential.user!.uid);
            // .collection(userCredential.user!.email!);

            final response = await usercollection.set(params.toJson());
          }

          return ApiResponse(data: userCredential);
        }

        return ApiResponse(error: const []);
      } //
      on FirebaseException catch (e) {
        final exception = FirebaseExceptionMapper.mapFirebaseException(e);
        return ApiResponse(error: exception.code);
      } //
      catch (e) {
        return ApiResponse(
            error: NetworkException.getErrorMessage(
                NetworkException.unexpectedError()));
      }
    } //
    else {
      return ApiResponse(
          error: NetworkException.getErrorMessage(
              NetworkException.noInternetConnection()));
    }
  }

  @override
  Future<ApiResponse> siginWithgoogleSigin() async {
    if (await networkInfo.isConnected) {
      try {
        GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();

        final userCredential = await FirebaseService.firebaseAuth
            .signInWithProvider(googleAuthProvider);

        return ApiResponse(data: userCredential);
      } on FirebaseException catch (e) {
        final exception = FirebaseExceptionMapper.mapFirebaseException(e);
        return ApiResponse(error: exception.code);
      } catch (e) {
        return ApiResponse(
            error: NetworkException.getErrorMessage(
                NetworkException.unexpectedError()));
      }
    } //
    else {
      return ApiResponse(
          error: NetworkException.getErrorMessage(
              NetworkException.noInternetConnection()));
    }
  }
}
