import 'package:shoesly/crore/data/firebase/api_response.dart';

abstract class ReviewRepository {
  Future<ApiResponse> getAllReview();
}
