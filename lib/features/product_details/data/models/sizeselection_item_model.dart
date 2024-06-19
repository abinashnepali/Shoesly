import 'package:get/get.dart';

class SizeSelectionItemModel {
  SizeSelectionItemModel({required this.size, required this.isSizeSelected});
  double size;
  RxBool? isSizeSelected;

  SizeSelectionItemModel.init({required this.size})
      : isSizeSelected = false.obs;
}

RxList<SizeSelectionItemModel> sizeListInfo = <SizeSelectionItemModel>[
  SizeSelectionItemModel.init(
    size: 39,
  ),
  SizeSelectionItemModel.init(
    size: 39.5,
  ),
  SizeSelectionItemModel.init(
    size: 40,
  ),
  SizeSelectionItemModel.init(
    size: 40.5,
  ),
  SizeSelectionItemModel.init(
    size: 41,
  )
].obs;
