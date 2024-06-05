import 'package:get/get.dart';
import 'package:shoesly/crore/presentation/widgets/loading_dialog.dart';
import 'package:shoesly/features/discover/data/models/productgrid_item_model.dart';

class DiscoverController extends GetxController {
  void onInit() {
    super.onInit();
    fetchProductList();
  }

  List<ProductgirdItemModel> productList = [];
  List<ProductgirdItemModel> _productDetailsResponse = [];

  fetchProductList({bool filter = true}) {
    CustomLoadingDialog.showProgressDialog();
    if (productgridList.length > 1) {
      if (filter == true) productList.clear();
      productList.addAll(productgridList);
      productDetailsResponse = productList;
    }
    CustomLoadingDialog.hideProgressDialog();
  }

  set productDetailsResponse(List<ProductgirdItemModel> response) {
    _productDetailsResponse = response;
    update();
  }

  List<ProductgirdItemModel> get productDetailsResponse =>
      _productDetailsResponse;
}
