import 'package:get/get.dart';

import 'product_list_controller.dart';

class ProductListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductListController());
  }
}
