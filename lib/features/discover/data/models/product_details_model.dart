import 'package:shoesly/crore/utils/constants.dart';

class ProductDetailsModel {
  ProductDetailsModel(
      {required this.brandImage,
      required this.productImage,
      required this.productName,
      required this.rating,
      required this.reviewCount,
      required this.price,
      required this.id,
      this.description,
      this.color,
      this.gender,
      this.size});

  String? brandImage;
  String? productImage;
  String? productName;
  double? rating;
  String? reviewCount;
  double? price;
  String? id;
  String? description;
  String? color;
  String? gender;
  String? size;

  factory ProductDetailsModel.fromMap(Map<String, dynamic> map) {
    String imagefilePath = '';
    map['productImage'] != null
        ? imagefilePath = '${Constants.productImage}/${map['productImage']}'
        : imagefilePath = Constants.noImage;

    return ProductDetailsModel(
        brandImage: '${Constants.imgBrand}/${map['brandImage'] ?? ''}',
        productImage: imagefilePath,
        productName: map['productName'] ?? '',
        rating: double.parse((map['rating'] ?? '1').toString()),
        reviewCount: map['reviewCount'],
        price: double.parse((map['price'] ?? 00.00).toString()),
        id: map['id'] ?? '',
        description: map['description'] ?? '',
        color: map['color'] ?? '',
        gender: map['gender'] ?? '',
        size: map['size'] ?? '');
  }
}

  //  brandImage: '${Constants.imgBrand}/nike.png',
  //     productImage: '${Constants.productImage}/Product.png',
