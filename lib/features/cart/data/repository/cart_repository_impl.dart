import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesly/core/data/firebase/api_response.dart';
import 'package:shoesly/core/data/firebase/firebase_exception_mapper.dart';
import 'package:shoesly/core/data/firebase/firebase_services.dart';
import 'package:shoesly/core/data/firebase/network_exception.dart';
import 'package:shoesly/core/data/firebase/network_info.dart';
import 'package:shoesly/core/utils/constants.dart';
import 'package:shoesly/core/utils/constants_message.dart';
import 'package:shoesly/features/cart/data/models/cart_model.dart';
import 'package:shoesly/features/cart/data/repository/cart_repository.dart';
import 'package:uid/uid.dart';

class CartRepositoryImpl implements CartRepository {
  final NetworkInfo networkInfo;

  CartRepositoryImpl({required this.networkInfo});
  @override
  Future<ApiResponse> addToCart(List<CartItemModel> cartList) async {
    if (await networkInfo.isConnected) {
      try {
        //
        String userId = '';
        final user = FirebaseService.firebaseAuth.currentUser;
        if (user == null) {
          userId = UId.getId();
        } else {
          userId = user.uid;
        }

        final cartItemCollection = FirebaseService.firestore
            .collection(Constants.firebaseCart)
            .doc(userId)
            .collection(Constants.firebaseCartItem);

        WriteBatch batch = FirebaseService.firestore.batch();

        for (var item in cartList) {
          final docRef = cartItemCollection.doc(item.productId);
          batch.set(docRef, item.toJson());
        }
        await batch.commit();
        return ApiResponse(data: ConstantsMessage.orderPlaced);
      } catch (e) {
        print(e.toString());
        if (e is FirebaseException) {
          final exception = FirebaseExceptionMapper.mapFirebaseException(e);
          return ApiResponse(error: exception.code);
        }

        return ApiResponse(error: e.toString());
      }
    } else {
      return ApiResponse(
          error: NetworkException.getErrorMessage(
              NetworkException.noInternetConnection()));
    }
  }

  @override
  Future<ApiResponse> getCartDetails(String userId) async {
    if (await networkInfo.isConnected) {
      try {
        final userCartCollection = await FirebaseService.firestore
            .collection(Constants.firebaseCart)
            .doc(userId)
            .collection(Constants.firebaseCartItem)
            .get();

        final userCartList = userCartCollection.docs
            .map((doc) => CartItemModel.fromJson(doc.data()))
            .toList();
        return ApiResponse(data: userCartList);
      } //

      catch (e) {
        if (e is FirebaseException) {
          final exception = FirebaseExceptionMapper.mapFirebaseException(e);
          return ApiResponse(error: exception.code);
        }

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
