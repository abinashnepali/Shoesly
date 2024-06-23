class ProductDetailsModel {
  ProductDetailsModel(
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
  double? rating;
  int? reviewCount;
  double? price;
  String? id;

  factory ProductDetailsModel.fromMap(Map<String, dynamic> map) {
    return ProductDetailsModel(
      brandImage: map['brandImage'],
      productImage: map['productImage'],
      productName: map['productName'] as String,
      rating: map['rating'] as double, // Ensure rating is a double
      reviewCount: map['reviewCount'] as int, // Ensure reviewCount is an int
      price: map['price'] as double, // Ensure price is a double
      id: map['id'] as String,
    );
  }
}
