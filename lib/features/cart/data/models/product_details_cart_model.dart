import 'package:get/get.dart';
import 'package:shoesly/crore/utils/constants.dart';

class ProductDetailsCartModel {
  ProductDetailsCartModel({
    required this.productImage,
    required this.productName,
    required this.price,
    required this.brandName,
    required this.shoeColor,
    required this.size,
    required int numberOfQuantity,
  }) : numberOfQuantity = numberOfQuantity.obs;

  final String? productImage;
  final String? productName;
  final String? price;
  final String? brandName;
  final String? shoeColor;
  final double? size;
  RxInt? numberOfQuantity;
}

List<ProductDetailsCartModel> productDetailsCartList = [
  ProductDetailsCartModel(
      brandName: 'Nike',
      productImage: '${Constants.productImage}/Product.png',
      productName: 'Jordand 1 Retro High Tie Dye',
      price: '\$235,00',
      shoeColor: 'Red Grey',
      size: 40,
      numberOfQuantity: 1),
  ProductDetailsCartModel(
      brandName: 'jordan',
      productImage: '${Constants.productImage}/Product2.png',
      productName: 'Jordand 1 Retro High Tie Dye',
      price: '\$235,00',
      shoeColor: ' Grey',
      size: 42,
      numberOfQuantity: 1),
  ProductDetailsCartModel(
      brandName: 'adidas',
      productImage: '${Constants.productImage}/Product3.png',
      productName: 'Jordand 1 Retro High Tie Dye',
      price: '\$235,00',
      shoeColor: 'Green Gobin',
      size: 42,
      numberOfQuantity: 1),
];
