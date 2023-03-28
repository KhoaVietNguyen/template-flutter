import 'package:get/get.dart';

import 'x_controller.dart';

class XBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => XController());
  }
}
