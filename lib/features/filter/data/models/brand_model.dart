import 'package:get/get.dart';
import 'package:shoesly/crore/utils/constants.dart';

class BrandModel {
  BrandModel(
      {required this.brandName, required this.brandImagePath, this.isSelected});
  final String? brandName;
  final String? brandImagePath;
  RxBool? isSelected;

  BrandModel.init({required this.brandName, required this.brandImagePath})
      : isSelected = false.obs;
}

RxList<BrandModel> branditemList = [
  BrandModel.init(
    brandImagePath: '${Constants.imgBrand}/nike.png',
    brandName: 'Nike',
  ),
  BrandModel.init(
    brandImagePath: '${Constants.imgBrand}/jordan.png',
    brandName: 'Jordan',
  ),
  BrandModel.init(
    brandImagePath: '${Constants.imgBrand}/adidas.png',
    brandName: 'Adidas',
  ),
  BrandModel.init(
    brandImagePath: '${Constants.imgBrand}/brand.png',
    brandName: 'Brand',
  ),
  BrandModel.init(
    brandImagePath: '${Constants.imgBrand}/vans.png',
    brandName: 'Vans',
  ),
  BrandModel.init(
    brandImagePath: '${Constants.imgBrand}/puma.png',
    brandName: 'Puma',
  ),
].obs;
