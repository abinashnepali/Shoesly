import 'package:get/get.dart';
import 'package:shoesly/core/presentation/widgets/toast.dart';
import 'package:shoesly/features/cart/data/models/cart_model.dart';
import 'package:shoesly/features/discover/data/models/product_details_model.dart';

class LocalCartController extends GetxController {
  var cartItemList = <CartItemModel>[];

  void addcartToLocal(
      {required ProductDetailsModel productmodel, required int noOfquanity}) {
    if (noOfquanity > 0 && productmodel != null) {
      // cartItemList.add(cartItem);
      final cartItem = CartItemModel(
          productImage: productmodel.productImage,
          productName: productmodel.productName,
          brandName: 'Nike', //productmodel.brandImage,
          noOfQty: noOfquanity,
          price: productmodel.price.toString(),
          productId: productmodel.id,
          shoeColor: productmodel.color,
          size: productmodel.size,
          totalPrice: (productmodel.price! * noOfquanity));
      cartItemList.add(cartItem);
      update();
    } //
    else {
      showFailureToast('No item to Add');
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
    update();
  }

  void removeCartItem(CartItemModel cartItem) {
    try {
      bool isdelted = cartItemList.remove(cartItem);

      isdelted
          ? showToast('CartItem Successful removed')
          : showFailureToast('CartItem cannot be  removed');
    } //
    catch (e) {
      showFailureToast(e.toString());
    }
  }

  List<CartItemModel> get localCartDetails => cartItemList;
}
