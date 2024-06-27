import 'package:get/get.dart';
import 'package:shoesly/core/data/firebase/api_response.dart';
import 'package:shoesly/core/presentation/widgets/loading_dialog.dart';
import 'package:shoesly/core/presentation/widgets/toast.dart';
import 'package:shoesly/features/cart/data/models/cart_model.dart';
import 'package:shoesly/features/cart/data/repository/cart_repository.dart';

class CartItemController extends GetxController {
  late CartRepository cartRepository;

  void onInit() {
    super.onInit();
    cartRepository = Get.find<CartRepository>();
  }

  ApiResponse cartApiResponse = ApiResponse(isLoading: true);

  set productDetailsResponse(ApiResponse response) {
    cartApiResponse = response;
    update();
  }

  get productDetailsApiResponse => cartApiResponse;

  // get CartDetails

  Future<void> getCartDetails() async {
    String userName = '';
    CustomLoadingDialog.showProgressDialog();
    final _cartDetailsReponse = await cartRepository.getCartDetails(userName);
    CustomLoadingDialog.hideProgressDialog();
    cartApiResponse = _cartDetailsReponse;
  }

  // End of  GetCart

  // Add to Cart

  Future<void> addToCartOnFirebase(List<CartItemModel> cartinfo) async {
    final _cartReponse = await cartRepository.addToCart(cartinfo);
    cartApiResponse.isLoading = false;
    if (_cartReponse.hasError) {
      showFailureToast(_cartReponse.error.toString());
    } else if (_cartReponse.hasData) {
      showToast(_cartReponse.data);
    }
    productDetailsResponse = _cartReponse;
  }

  // End of Cart
}
