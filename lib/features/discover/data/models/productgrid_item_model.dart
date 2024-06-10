import 'package:shoesly/crore/utils/constants.dart';

class ProductgirdItemModel {
  ProductgirdItemModel(
      {required this.brandImage,
      required this.productImage,
      required this.productName,
      required this.rating,
      required this.reviewCount,
      required this.price,
      required this.id});

  String? brandImage;
  String? productImage;
  String? productName;
  String? rating;
  String? reviewCount;
  String? price;
  String? id;
}

List<ProductgirdItemModel> productgridList = [
  ProductgirdItemModel(
      brandImage: '${Constants.imgBrand}/nike.png',
      productImage: '${Constants.productImage}/Product.png',
      productName: 'Jordand 1 Retro High Tie Dye',
      rating: '4.5',
      reviewCount: '(1045 Reviews)',
      price: '\$235,00',
      id: '1'),
  ProductgirdItemModel(
      brandImage: '${Constants.imgBrand}/jordan.png',
      productImage: '${Constants.productImage}/Product2.png',
      productName: 'Jordand 1 Retro High Tie Dye',
      rating: '4.5',
      reviewCount: '(1045 Reviews)',
      price: '\$235,00',
      id: '1'),
  ProductgirdItemModel(
      brandImage: '${Constants.imgBrand}/adidas.png',
      productImage: '${Constants.productImage}/Product3.png',
      productName: 'Jordand 1 Retro High Tie Dye',
      rating: '4.5',
      reviewCount: '(1045 Reviews)',
      price: '\$235,00',
      id: '1'),
  ProductgirdItemModel(
      brandImage: '${Constants.imgBrand}/brand.png',
      productImage: '${Constants.productImage}/Product4.png',
      productName: 'Jordand 1 Retro High Tie Dye',
      rating: '4.5',
      reviewCount: '(1045 Reviews)',
      price: '\$235,00',
      id: '1'),
  ProductgirdItemModel(
      brandImage: '${Constants.imgBrand}/vans.png',
      productImage: '${Constants.productImage}/Product5.png',
      productName: 'Jordand 1 Retro High Tie Dye',
      rating: '4.5',
      reviewCount: '(1045 Reviews)',
      price: '\$235,00',
      id: '1'),
  ProductgirdItemModel(
      brandImage: '${Constants.imgBrand}/puma.png',
      productImage: '${Constants.productImage}/Product.png',
      productName: 'Jordand 1 Retro High Tie Dye',
      rating: '4.5',
      reviewCount: '(1045 Reviews)',
      price: '\$235,00',
      id: '1'),
  ProductgirdItemModel(
      brandImage: '${Constants.imgBrand}/vans.png',
      productImage: '${Constants.productImage}/Product7.png',
      productName: 'Jordand 1 Retro High Tie Dye',
      rating: '4.5',
      reviewCount: '(1045 Reviews)',
      price: '\$235,00',
      id: '1'),
  ProductgirdItemModel(
      brandImage: '${Constants.imgBrand}/puma.png',
      productImage: '${Constants.productImage}/Product8.png',
      productName: 'Jordand 1 Retro High Tie Dye',
      rating: '4.5',
      reviewCount: '(1045 Reviews)',
      price: '\$235,00',
      id: '1'),
];
