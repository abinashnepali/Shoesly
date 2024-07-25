import 'package:get/get.dart';
import 'package:shoesly/core/di/core_binding.dart';
import 'package:shoesly/core/presentation/routes/app_routes.dart';
import 'package:shoesly/features/cart/di/bindings/cart_binding.dart';
import 'package:shoesly/features/cart/presentation/cart_screen.dart';
import 'package:shoesly/features/discover/data/models/product_details_model.dart';
import 'package:shoesly/features/discover/di/discover_binding.dart';
import 'package:shoesly/features/discover/presentation/discover_screen.dart';
import 'package:shoesly/features/filter/presentation/filter_screen.dart';
import 'package:shoesly/features/home_tab_container/data/di/home_tab_container_binding.dart';
import 'package:shoesly/features/home_tab_container/home_tab_container_screen.dart';
import 'package:shoesly/features/orderSummary/presentation/order_summary_screen.dart';
import 'package:shoesly/features/productReview/di/review_binding.dart';
import 'package:shoesly/features/product_details/di/product_details_bindings.dart';
import 'package:shoesly/features/product_details/presentation/product_details_screen.dart';
import 'package:shoesly/features/productReview/presentation/product_review_screen.dart';
import 'package:shoesly/features/user/data/di/bindings/auth_bindings.dart';
import 'package:shoesly/features/user/presentation/login_screen.dart';
import 'package:shoesly/features/user/presentation/profile_screen.dart';
import 'package:shoesly/features/user/presentation/wigets/edit_profile_screen.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.homeTabContainer;
  // static const initial = Routes.profileScreen;

  static final routes = [
    GetPage(
        name: Routes.homeTabContainer,
        page: HomeTabContainerScreen.new,
        bindings: [
          CoreBindings(),
          AuthBindings(),
          HomeTabContainerBinding(),
          ProductDetailBindings(),
          DiscoverBinding(),
          CartControllerBindings(),
        ]),
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
              arguments is ProductDetailsModel ? arguments : null;

          return ProductDetailsScreen(
            productDetailsModel: productDetailsModel,
          );
        },
        bindings: [
          ReviewControllerBinding(),
          ProductDetailBindings(),
          CartControllerBindings()
        ]),
    GetPage(
        name: Routes.productReview,
        page: ProductReviewScreen.new,
        bindings: [ReviewControllerBinding()]),
    GetPage(
        name: Routes.cartScreen,
        page: CartScreen.new,
        bindings: [CartControllerBindings()]),
    GetPage(
      name: Routes.productFilter,
      page: FilterScreen.new,
    ),
    GetPage(
        name: Routes.loginScreen,
        page: LoginScreen.new,
        bindings: [AuthBindings()]),
    GetPage(
        name: Routes.profileScreen,
        page: ProfileScreen.new,
        bindings: [AuthBindings()]),
    GetPage(
        name: Routes.editprofileScreen,
        page: EditProfile.new,
        bindings: [AuthBindings()]),
  ];
}
