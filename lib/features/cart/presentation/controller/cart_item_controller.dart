import 'package:get/get.dart';
import 'package:shoesly/crore/utils/constants.dart';
import 'package:shoesly/features/cart/data/models/product_details_cart_model.dart';

class CartItemController extends GetxController {
  // @override
  // void onInit() {
  //   super.onInit();
  //   productDetailsCartList.addAll([
  //     ProductDetailsCartModel(
  //         brandName: 'Nike',
  //         productImage: '${Constants.productImage}/Product.png',
  //         productName: 'Jordan 1 Retro High Tie Dye',
  //         price: '\$235.00',
  //         shoeColor: 'Red Grey',
  //         size: 40,
  //         numberOfQuantity: 1),
  //     ProductDetailsCartModel(
  //         brandName: 'Jordan',
  //         productImage: '${Constants.productImage}/Product2.png',
  //         productName: 'Jordan 1 Retro High Tie Dye',
  //         price: '\$235.00',
  //         shoeColor: ' Grey',
  //         size: 42,
  //         numberOfQuantity: 1),
  //     ProductDetailsCartModel(
  //         brandName: 'Adidas',
  //         productImage: '${Constants.productImage}/Product3.png',
  //         productName: 'Jordan 1 Retro High Tie Dye',
  //         price: '\$235.00',
  //         shoeColor: 'Green Goblin',
  //         size: 42,
  //         numberOfQuantity: 1),
  //   ]);
  // }

  void addRemoveItemOnCart({bool? addItem, bool? removeItem, required index}) {
    int quanity = 0;
    if (addItem ?? false) {
      productDetailsCartList[index].numberOfQuantity?.value++;
    }
    if (removeItem ?? false) {
      if (productDetailsCartList[index].numberOfQuantity?.value != 0) {
        productDetailsCartList[index].numberOfQuantity?.value--;
      }
    }
  }
}
