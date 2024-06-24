import 'package:shoesly/core/data/firebase/api_response.dart';

abstract class DiscoveryRepository {
  Future<ApiResponse> getAllProduct();
}
