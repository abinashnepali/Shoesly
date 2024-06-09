import 'package:get/get.dart';
import 'package:shoesly/crore/presentation/routes/app_routes.dart';
import 'package:shoesly/features/discover/data/models/productgrid_item_model.dart';
import 'package:shoesly/features/discover/presentation/discover_screen.dart';
import 'package:shoesly/features/home_tab_container/data/di/home_tab_container_binding.dart';
import 'package:shoesly/features/home_tab_container/home_tab_container_screen.dart';
import 'package:shoesly/features/orderSummary/presentation/order_summary_screen.dart';
import 'package:shoesly/features/productReview/di/review_controller_binding.dart';
import 'package:shoesly/features/product_details/data/models/product_details_model.dart';
import 'package:shoesly/features/product_details/presentation/product_details_screen.dart';
import 'package:shoesly/features/productReview/presentation/product_review_screen.dart';

class AppPages {
  AppPages._();

  //static const initial = Routes.homeTabContainer;
  static const initial = Routes.productReview;

  static final routes = [
    GetPage(
        name: Routes.homeTabContainer,
        page: HomeTabContainerScreen.new,
        bindings: [HomeTabContainerBinding()]),
    GetPage(name: Routes.discover, page: DiscoverScreen.new),
    GetPage(name: Routes.orderSummary, page: OrderSummary.new),
    GetPage(
      name: Routes.productDetails,
      // page: () => ProductDetailsScreen(
      //       productDetailsModel: Get.arguments,
      //     )
      page: () {
        final arguments = Get.arguments;
        final productDetailsModel =
            arguments is ProductgirdItemModel ? arguments : null;

        return ProductDetailsScreen(
          productDetailsModel: productDetailsModel,
        );
      },
    ),
    GetPage(
        name: Routes.productReview,
        page: ProductReviewScreen.new,
        bindings: [ReviewControllerBinding()]),
  ];
}
