import 'package:get/get.dart';
import 'package:shoesly/core/data/firebase/api_response.dart';

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
  ApiResponse _productDetailsResponse = ApiResponse(isLoading: true);

// fetch products from firebase
  Future<void> fetchProductList({bool filter = false}) async {
    final productresponse = await discoveryRepository.getAllProduct();
    _productDetailsResponse.isLoading = false;
    productDetailsResponse = productresponse;

    if (productresponse.hasError) {
      showFailureToast(productresponse.error.toString());
    } else {
      if (productresponse.data.length > 1) {
        if (filter == true) productList.clear();
        productList.addAll(productresponse.data);
        //  productDetailsResponse = productList;
        productDetailsResponse = productresponse;
      } else {
        // showFailureToast(productresponse.error.toString());
      }
    }
  }

  set productDetailsResponse(ApiResponse response) {
    _productDetailsResponse = response;
    update();
  }

  get productDetailsApiResponse => _productDetailsResponse;
}
