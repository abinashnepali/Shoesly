import 'package:shoesly/core/data/firebase/api_response.dart';
import 'package:shoesly/features/cart/data/models/cart_model.dart';

abstract class CartRepository {
  Future<ApiResponse> getCartDetails(String userId);
  Future<ApiResponse> addToCart(List<CartItemModel> cartList);
}
