import 'package:shoesly/crore/utils/constants.dart';

class BrandModel {
  BrandModel({required this.brandName, required this.brandImagePath});
  final String? brandName;
  final String? brandImagePath;
}

List<BrandModel> branditemList = [
  BrandModel(
      brandImagePath: '${Constants.imgBrand}/nike.png', brandName: 'Nike'),
  BrandModel(
      brandImagePath: '${Constants.imgBrand}/jordan.png', brandName: 'Jordan'),
  BrandModel(
      brandImagePath: '${Constants.imgBrand}/adidas.png', brandName: 'Adidas'),
  BrandModel(
      brandImagePath: '${Constants.imgBrand}/brand.png', brandName: 'Brand'),
  BrandModel(
      brandImagePath: '${Constants.imgBrand}/vans.png', brandName: 'Vans'),
  BrandModel(
      brandImagePath: '${Constants.imgBrand}/puma.png', brandName: 'Puma'),
];
