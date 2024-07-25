import 'package:get/get.dart';

import 'package:shoesly/core/data/firebase/api_response.dart';
import 'package:shoesly/core/data/firebase/firebase_services.dart';
import 'package:shoesly/core/presentation/routes/app_routes.dart';
import 'package:shoesly/core/presentation/widgets/loading_dialog.dart';
import 'package:shoesly/core/presentation/widgets/toast.dart';
import 'package:shoesly/features/cart/data/repository/cart_repository.dart';
import 'package:shoesly/features/cart/presentation/controller/local_cart_controller.dart';

class CartItemController extends GetxController {
  late CartRepository cartRepository;

  late LocalCartController _localCartController;

  @override
  void onInit() {
    super.onInit();
    _localCartController = Get.find<LocalCartController>();
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
    final cartDetailsReponse = await cartRepository.getCartDetails(userName);
    CustomLoadingDialog.hideProgressDialog();
    cartApiResponse = cartDetailsReponse;
  }

  // End of  GetCart

  // Add to Cart

  Future<void> addToCartOnFirebase() async {
    final cartInfo = _localCartController.localCartDetails;
    final isAuthenticated = FirebaseService.isAuthenticated();
    if (!isAuthenticated) {
      Get.toNamed(Routes.loginScreen);
      return;
    }
    final cartReponse = await cartRepository.addToCart(cartInfo);
    cartApiResponse.isLoading = false;
    if (cartReponse.hasError) {
      showFailureToast(cartReponse.error.toString());
    } else if (cartReponse.hasData) {
      showToast(cartReponse.data);
      Get.toNamed(Routes.orderSummary);
      _localCartController.removeCartFromLocal();
    }
    productDetailsResponse = cartReponse;
  }

  // End of Cart
}
