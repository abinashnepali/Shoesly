import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesly/crore/data/firebase/api_response.dart';
import 'package:shoesly/crore/data/firebase/firebase_exception_mapper.dart';
import 'package:shoesly/crore/data/firebase/firebase_services.dart';
import 'package:shoesly/crore/data/firebase/network_exception.dart';
import 'package:shoesly/crore/data/firebase/network_info.dart';
import 'package:shoesly/crore/utils/constants.dart';
import 'package:shoesly/features/productReview/data/models/review_model.dart';
import 'package:shoesly/features/productReview/data/repository/review_repository.dart';

class ReviewRepositoryimpl implements ReviewRepository {
  final NetworkInfo networkInfo;

  ReviewRepositoryimpl({required this.networkInfo});

  @override
  Future<ApiResponse> getAllReview() async {
    if (await networkInfo.isConnected) {
      try {
        final reviewSnapShot = await FirebaseService.firestore
            .collection(Constants.reviewdList)
            .get();
        final reviewList = reviewSnapShot.docs
            .map((doc) => ReviewModel.fromJson(doc.data()))
            .toList();
        return ApiResponse(data: reviewList);
      } //
      catch (e) {
        if (e is FirebaseException) {
          final exception = FirebaseExceptionMapper.mapFirebaseException(e);
          return ApiResponse(error: exception);
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
