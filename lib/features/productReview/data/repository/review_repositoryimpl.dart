import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesly/core/data/firebase/api_response.dart';
import 'package:shoesly/core/data/firebase/firebase_exception_mapper.dart';
import 'package:shoesly/core/data/firebase/firebase_services.dart';
import 'package:shoesly/core/data/firebase/network_exception.dart';
import 'package:shoesly/core/data/firebase/network_info.dart';
import 'package:shoesly/core/utils/constants.dart';
import 'package:shoesly/features/productReview/data/models/review_model.dart';
import 'package:shoesly/features/productReview/data/repository/review_repository.dart';

class ReviewRepositoryimpl implements ReviewRepository {
  final NetworkInfo networkInfo;

  ReviewRepositoryimpl({required this.networkInfo});

  @override
  Future<ApiResponse> getAllReview() async {
    if (await networkInfo.isConnected) {
      try {
        final querySnapshot = await FirebaseService.firestore
            .collection(Constants.reviewdList)
            .get();
        //  final reviewList = reviewSnapShot.docs
        //     .map((doc) => ReviewModel.fromJson(doc.data()))
        //     .toList();
        // final userSnapShot = await FirebaseService.firestore
        //     .collection(Constants.userinfo)
        //     .get();
        final reviews = <ReviewModel>[];
        for (final doc in querySnapshot.docs) {
          final review = ReviewModel.fromJson(doc.data());

          final userdoc = await FirebaseService.firestore
              .collection(Constants.userinfo)
              .doc(review.userID)
              .get();

          review.imagePath = userdoc['imagePath'] ?? Constants.noImage;
          review.userName = userdoc['Full Name'] ?? '';

          reviews.add(review);
        }

        return ApiResponse(data: reviews);
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
