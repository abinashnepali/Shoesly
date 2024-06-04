abstract class Routes {
  Routes._();

  static const homeTabContainer = _Paths.homeTabContainer;
  static const discover = _Paths.discover;
  static const productDetails = _Paths.productDetails;
  static const productFilter = _Paths.productFilter;
  static const productReview = _Paths.productReview;

  static const addtoCart = _Paths.addtoCart;
  static const cartScreen = _Paths.cartScreen;
  static const orderSummary = _Paths.orderSummary;
}

abstract class _Paths {
  static const homeTabContainer = '/homeTabContainer';
  static const discover = '/discover';
  static const productDetails = '/productDetails';
  static const productFilter = '/productFilter';
  static const productReview = '/productReview';

  static const addtoCart = '/addtoCart';
  static const cartScreen = '/cartScreen';
  static const orderSummary = '/orderSummary';
}
