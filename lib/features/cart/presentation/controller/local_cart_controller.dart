import 'dart:convert';
import 'package:get/get.dart';

import 'package:shoesly/core/data/firebase/api_response.dart';
import 'package:shoesly/core/presentation/widgets/toast.dart';
import 'package:shoesly/core/utils/constants.dart';
import 'package:shoesly/core/utils/constants_message.dart';
import 'package:shoesly/core/utils/pref_utils.dart';
import 'package:shoesly/features/cart/data/models/cart_model.dart';
import 'package:shoesly/features/discover/data/models/product_details_model.dart';

class LocalCartController extends GetxController {
  var cartItemList = <CartItemModel>[];
  late PrefUtils perfs;

  @override
  void onInit() {
    super.onInit();
    perfs = Get.find<PrefUtils>();
    _loadCartListDetailsFromSharePerf();
  }

// This function add   product item on Cart
  ApiResponse addcartToLocal(
      {required ProductDetailsModel productmodel, required int noOfquanity}) {
    if (noOfquanity > 0) {
      bool isProductexist =
          cartItemList.any((item) => item.productId == productmodel.id);

      if (isProductexist) {
        var item = cartItemList
            .firstWhere((item) => item.productId == productmodel.id);
        int numberofQuanity = item.noOfQty! + noOfquanity;
        if (numberofQuanity >= 21) {
          showFailureToast(ConstantsMessage.productOverquanity);

          return ApiResponse(error: const []);
        }
        item.noOfQty = numberofQuanity;
        item.totalPrice = productmodel.price! * item.noOfQty!;
        return ApiResponse(data: const []);
      }

      final cartItem = CartItemModel(
          productImage: productmodel.productImage,
          productName: productmodel.productName,
          brandName: productmodel.brandName,
          noOfQty: noOfquanity,
          price: productmodel.price.toString(),
          productId: productmodel.id,
          shoeColor: productmodel.color,
          size: productmodel.size,
          totalPrice: (productmodel.price! * noOfquanity));
      cartItemList.add(cartItem);
      update();
      _saveCartListDetailsToSharePerf();
      return ApiResponse(data: const []);
    } //
    else {
      showFailureToast(ConstantsMessage.noItemtoAdd);
      return ApiResponse(error: const []);
    }
  }

  void addRemoveItemOnCart({bool? addItem, bool? removeItem, required index}) {
    int numberofQty = cartItemList[index].noOfQty ?? 0;
    if (addItem ?? false) {
      cartItemList[index].noOfQty = numberofQty + 1;
    }
    if (removeItem ?? false) {
      if (numberofQty != 1) {
        cartItemList[index].noOfQty = numberofQty - 1;
      }
    }
    cartItemList[index].totalPrice = double.parse(cartItemList[index].price!) *
        double.parse(cartItemList[index].noOfQty!.toString());

    update();
    _saveCartListDetailsToSharePerf();
  }

  void removeCartItem(CartItemModel cartItem) {
    try {
      bool isdelted = cartItemList.remove(cartItem);
      update();
      isdelted
          ? showToast(ConstantsMessage.removeCartItem)
          : showFailureToast(ConstantsMessage.cartItemCannotbeRemoved);
      _saveCartListDetailsToSharePerf();
    } //
    catch (e) {
      showFailureToast(e.toString());
    }
  }

// calculated total price
  double get grandTotalPrice {
    return cartItemList.fold(0.0, (sum, item) => sum + (item.totalPrice ?? 0));
  }

  // Share perf

  Future<void> _loadCartListDetailsFromSharePerf() async {
    String? cartJson = perfs.getString(Constants.perfcartItemList);

    if (cartJson != null) {
      List<dynamic> cartList = jsonDecode(cartJson);
      cartItemList =
          cartList.map((item) => CartItemModel.fromJson(item)).toList();
      update();
    }
  }

  Future<void> _saveCartListDetailsToSharePerf() async {
    String cartJson =
        jsonEncode(cartItemList.map((item) => item.toJson()).toList());
    await perfs.setString(Constants.perfcartItemList, cartJson);
  }

  List<CartItemModel> get localCartDetails => cartItemList;

  Future<void> removeCartFromLocal() async {
    cartItemList = [];

    update();
    await perfs.removePref(Constants.perfcartItemList);
  }
}
