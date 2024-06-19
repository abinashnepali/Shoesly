import 'package:get/get.dart';
import 'package:shoesly/features/filter/data/models/brand_model.dart';
import 'package:shoesly/features/filter/data/models/range_model.dart';

class FilterController extends GetxController {
  Rx<CustomRangeValues> sliderValues = CustomRangeValues(200.0, 750.0).obs;

  // List to store the selected state of each SortItemWidget
  RxList<bool> sortFilterIsselectedList = <bool>[false, false, false].obs;

  RxList<bool> genderFilterIsselectedList = <bool>[false, false, false].obs;

  RxList<bool> colorFilterIsselectedList = <bool>[false, false, false].obs;

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

  void updateGenderSelection({required index, bool? value}) {
    genderFilterIsselectedList[index] = true;
    // Reset all other selections to false
    for (int i = 0; i < genderFilterIsselectedList.length; i++) {
      if (i != index) {
        genderFilterIsselectedList[i] = false;
      }
    }
  }

  void updateColorSelection({required index, bool? value}) {
    colorFilterIsselectedList[index] = true;
    // Reset all other selections to false
    for (int i = 0; i < colorFilterIsselectedList.length; i++) {
      if (i != index) {
        colorFilterIsselectedList[i] = false;
      }
    }
  }

  void updateBrandSelection({required int index}) {
    for (int i = 0; i < branditemList.length; i++) {
      branditemList[i].isSelected?.value = i == index;
    }
  }
}
