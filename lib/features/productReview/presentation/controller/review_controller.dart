import 'package:get/get.dart';
import 'package:shoesly/core/presentation/widgets/loading_dialog.dart';
import 'package:shoesly/core/presentation/widgets/toast.dart';
import 'package:shoesly/features/productReview/data/models/review_model.dart';
import 'package:shoesly/features/productReview/data/repository/review_repository.dart';

class ReviewController extends GetxController {
  late ReviewRepository reviewRepository;
  void onInit() {
    super.onInit();
    reviewRepository = Get.find<ReviewRepository>();
    fetchAllReview();
  }

  List<ReviewModel> _reviewinfoResponse = [];

  //  fetch review
  Future<void> fetchAllReview() async {
    CustomLoadingDialog.showProgressDialog();
    List<ReviewModel> _reviewList = [];

    final reviewResponse = await reviewRepository.getAllReview();
    if (reviewResponse.hasError) {
      showFailureToast(reviewResponse.error.toString());
    } else {
      if (reviewResponse.hasData) {
        // _reviewList.add(reviewResponse.data);
        reviewDateResponse = reviewResponse.data;
      } //
      else {
        showFailureToast('No data available');
      }
    }
  }

  set reviewDateResponse(List<ReviewModel> response) {
    _reviewinfoResponse = response;
    update();
  }

  get reviewListinfo => _reviewinfoResponse;

  // End of fetch review
}
