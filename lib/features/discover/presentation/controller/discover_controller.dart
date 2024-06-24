import 'package:get/get.dart';

import 'package:shoesly/core/presentation/widgets/loading_dialog.dart';
import 'package:shoesly/core/presentation/widgets/toast.dart';
import 'package:shoesly/features/discover/data/models/product_details_model.dart';
import 'package:shoesly/features/discover/data/repository/discovery_repository.dart';

class DiscoverController extends GetxController {
  late DiscoveryRepository discoveryRepository;

  void onInit() {
    super.onInit();
    discoveryRepository = Get.find<DiscoveryRepository>();
    fetchProductList();
  }

  List<ProductDetailsModel> productList = [];
  List<ProductDetailsModel> _productDetailsResponse = [];

// fetch products from firebase
  fetchProductList({bool filter = false}) async {
    CustomLoadingDialog.showProgressDialog();
    await Future.delayed(Duration(seconds: 3));

    final productresponse = await discoveryRepository.getAllProduct();
    CustomLoadingDialog.hideProgressDialog();

    if (productresponse.hasError) {
      showFailureToast(productresponse.error.toString());
    } else {
      if (productresponse.data.length > 1) {
        if (filter == true) productList.clear();
        productList.addAll(productresponse.data);
        productDetailsResponse = productList;
      } else {
        // showFailureToast(productresponse.error.toString());
      }
    }
  }

  set productDetailsResponse(List<ProductDetailsModel> response) {
    _productDetailsResponse = response;
    update();
  }

  List<ProductDetailsModel> get productDetailsResponse =>
      _productDetailsResponse;
}
