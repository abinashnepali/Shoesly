import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shoesly/core/data/firebase/api_response.dart';
import 'package:shoesly/core/data/firebase/firebase_exception_mapper.dart';
import 'package:shoesly/core/data/firebase/firebase_services.dart';
import 'package:shoesly/core/data/firebase/network_exception.dart';
import 'package:shoesly/core/data/firebase/network_info.dart';
import 'package:shoesly/core/utils/constants.dart';
import 'package:shoesly/features/discover/data/models/product_details_model.dart';
import 'package:shoesly/features/discover/data/repository/discovery_repository.dart';

class DiscoveryRepositoryimpl implements DiscoveryRepository {
  final NetworkInfo networkInfo;

  DiscoveryRepositoryimpl({required this.networkInfo});

  @override
  Future<ApiResponse> getAllProduct() async {
    if (await networkInfo.isConnected) {
      try {
        var productCollection =
            FirebaseService.firestore.collection(Constants.productDetailsList);

        QuerySnapshot productquerySnapshot = await productCollection.get();

        final productsList = productquerySnapshot.docs
            .map((doc) =>
                ProductDetailsModel.fromMap(doc.data() as Map<String, dynamic>))
            .toList();

        return ApiResponse(data: productsList);
      } //
      catch (e) {
        if (e is FirebaseException) {
          final exception = FirebaseExceptionMapper.mapFirebaseException(e);
          return ApiResponse(error: exception.message);
        }

        return ApiResponse(error: e.toString());
      }
    } //
    else {
      return ApiResponse(
          error: NetworkException.getErrorMessage(
              NetworkException.noInternetConnection()));
    }
  }
}
