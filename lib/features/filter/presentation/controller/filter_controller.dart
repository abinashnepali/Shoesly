import 'package:get/get.dart';
import 'package:shoesly/features/filter/data/models/range_model.dart';

class FilterController extends GetxController {
  Rx<CustomRangeValues> sliderValues = CustomRangeValues(200.0, 750.0).obs;

  // List to store the selected state of each SortItemWidget
  RxList<bool> sortFilterIsselectedList = <bool>[false, false, false].obs;

  void updateSliderValues(CustomRangeValues values) {
    sliderValues.value = values;
  }

  // Update the selected item
  void updateSortSelection({required index, bool? value}) {
    sortFilterIsselectedList[index] = true;
    // Reset all other selections to false
    for (int i = 0; i < sortFilterIsselectedList.length; i++) {
      if (i != index) {
        sortFilterIsselectedList[i] = false;
      }
    }
  }
}
