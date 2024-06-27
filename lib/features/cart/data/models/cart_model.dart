class CartItemModel {
  CartItemModel(
      {this.productId,
      this.shoeColor,
      this.size,
      required this.productImage,
      required this.productName,
      this.price,
      this.brandName,
      this.noOfQty,
      this.totalPrice});

  final String? productId;
  final String? productImage;
  final String? productName;
  final String? price;
  final String? brandName;
  final String? shoeColor;
  final String? size;
  int? noOfQty;
  double? totalPrice;

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
        shoeColor: json['shoeColor'] as String?,
        size: (json['size']) as String,
        productId: json['productId'] as String?,
        productImage: json['productImage'] as String?,
        productName: json['productName'] as String?,
        price: json['price'] as String?,
        brandName: json['brandName'] as String?,
        noOfQty: json['noOfQty'] as int?,
        totalPrice: (json['totalPrice'] as num?)?.toDouble());
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productImage': productImage,
      'productName': productName,
      'price': price,
      'brandName': brandName,
      'shoeColor': shoeColor,
      'size': size,
      'noOfQty': noOfQty,
      'totalPrice': totalPrice
    };
  }
}
