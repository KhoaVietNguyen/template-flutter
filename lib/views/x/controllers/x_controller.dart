import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XController extends GetxController with StateMixin<int> {
  final pageCtrler = PageController();

  @override
  void onInit() {
    super.onInit();
    change(0, status: RxStatus.success());
  }

  @override
  void onClose() {
    pageCtrler.dispose();
    super.onClose();
  }

  void toPage(int page, {bool turnPage = true}) {
    if (state != page) {
      change(page, status: RxStatus.success());
      if (turnPage) pageCtrler.jumpToPage(page);
    }
  }
}
