import 'package:get/get.dart';

import 'shopping_controller.dart';

class ShoppingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShoppingController());
  }
}
