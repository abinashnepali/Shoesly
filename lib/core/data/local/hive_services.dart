import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:shoesly/features/cart/data/models/cart_model.dart';

class HiveService {
  static Future<void> initHive() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    //  Hive.registerAdapter(CartItemModelAdapter());
  }

  Future<Box<CartItemModel>> getCartBox() async {
    await HiveService.initHive();
    return await Hive.openBox<CartItemModel>('cart');
  }

  Future<void> saveCartItem(CartItemModel cartItem) async {
    final box = await getCartBox();
    await box.add(cartItem);
  }

  Future<List<CartItemModel>> loadCartItems() async {
    final box = await getCartBox();
    return box.values.toList();
  }
}
