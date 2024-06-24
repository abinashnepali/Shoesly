import 'package:shoesly/core/data/firebase/api_response.dart';

abstract class ReviewRepository {
  Future<ApiResponse> getAllReview();
}
