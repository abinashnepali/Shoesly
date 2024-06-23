import 'package:get/get.dart';

import 'package:shoesly/crore/presentation/widgets/loading_dialog.dart';
import 'package:shoesly/crore/presentation/widgets/toast.dart';
import 'package:shoesly/features/discover/data/models/productgrid_item_model.dart';
import 'package:shoesly/features/discover/data/repository/discovery_repository.dart';

class DiscoverController extends GetxController {
  late DiscoveryRepository discoveryRepository;

  void onInit() {
    super.onInit();
    discoveryRepository = Get.find<DiscoveryRepository>();
    fetchProductList();
  }

  List<ProductgirdItemModel> productList = [];
  List<ProductgirdItemModel> _productDetailsResponse = [];

// fetch products from firebase
  fetchProductList({bool filter = false}) async {
    CustomLoadingDialog.showProgressDialog();

    final productresponse = await discoveryRepository.getAllProduct();
    CustomLoadingDialog.hideProgressDialog();

    if (productresponse.hasError) {
      showFailureToast(productresponse.error.toString());
    } else {
      if (productgridList.length > 1) {
        if (filter == true) productList.clear();
        productList.addAll(productresponse.data);
        productDetailsResponse = productList;
      } else {
        // showFailureToast(productresponse.error.toString());
      }
    }
  }

  set productDetailsResponse(List<ProductgirdItemModel> response) {
    _productDetailsResponse = response;
    update();
  }

  List<ProductgirdItemModel> get productDetailsResponse =>
      _productDetailsResponse;
}
