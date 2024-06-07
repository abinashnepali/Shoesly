class SizeSelectionItemModel {
  SizeSelectionItemModel({required this.size, required this.isSizeSelected});
  double size;
  bool isSizeSelected;
}

List<SizeSelectionItemModel> sizeListInfo = [
  SizeSelectionItemModel(size: 39, isSizeSelected: true),
  SizeSelectionItemModel(size: 39.5, isSizeSelected: false),
  SizeSelectionItemModel(size: 40, isSizeSelected: false),
  SizeSelectionItemModel(size: 40.5, isSizeSelected: false),
  SizeSelectionItemModel(size: 41, isSizeSelected: false)
];
