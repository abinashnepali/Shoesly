import 'package:get/get.dart';
import 'package:shoesly/core/data/firebase/api_response.dart';
import 'package:shoesly/core/presentation/widgets/loading_dialog.dart';
import 'package:shoesly/core/presentation/widgets/toast.dart';
import 'package:shoesly/core/utils/constants_message.dart';
import 'package:shoesly/features/productReview/data/models/review_model.dart';
import 'package:shoesly/features/productReview/data/repository/review_repository.dart';

class ReviewController extends GetxController {
  late ReviewRepository reviewRepository;
  @override
  void onInit() {
    super.onInit();
    reviewRepository = Get.find<ReviewRepository>();

    fetchAllReview();
  }

  List<ReviewModel> _reviewinfoResponse = [];

  late ApiResponse _reviewApiResponse;

  //  fetch review
  Future<void> fetchAllReview() async {
    if (_reviewinfoResponse.isNotEmpty) {
      return;
    }

    CustomLoadingDialog.showProgressDialog();
    List<ReviewModel> reviewList = [];

    final reviewResponse = await reviewRepository.getAllReview();
    if (reviewResponse.hasError) {
      showFailureToast(reviewResponse.error.toString());
    } else {
      if (reviewResponse.hasData) {
        reviewDateResponse = reviewResponse.data;
      } //
      else {
        showFailureToast(ConstantsMessage.noDataAvailable);
      }
    }
    reviewAPIResponse = reviewResponse;
  }

  set reviewDateResponse(List<ReviewModel> response) {
    _reviewinfoResponse = response;
    update();
  }

  set reviewAPIResponse(ApiResponse apiResponse) {
    _reviewApiResponse = apiResponse;
    update();
  }

  get reviewListinfo => _reviewinfoResponse;

  get reviewApireponse => _reviewApiResponse;

  // End of fetch review
}
