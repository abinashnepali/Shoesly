import 'package:shoesly/crore/data/firebase/api_response.dart';

abstract class DiscoveryRepository {
  Future<ApiResponse> getAllProduct();
}
