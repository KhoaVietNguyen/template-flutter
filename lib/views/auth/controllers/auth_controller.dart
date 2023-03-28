import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:template/models/user.dart';
import 'package:template/repositories/auth_repo.dart';
import 'package:template/routers/routes.dart';

class AuthController extends GetxController with StateMixin<MUser> {
  final isLoading = false.obs;
  final emailCtrler = TextEditingController();

  bool get authenticated => state != null;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    isLoading.value = true;
    final token = await AuthRepo.getAccessToken();
    isLoading.value = false;

    // TODO: handle token
    print(token);
  }

  @override
  void onClose() {
    emailCtrler.dispose();
    super.onClose();
  }

  Future<void> submit() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;

    change(
      MUser(id: 1, email: emailCtrler.text.trim()),
      status: RxStatus.success(),
    );
    _reset();
    Get.offAllNamed(AppRoute.home.path);
  }

  void _reset() {
    emailCtrler.clear();
  }

  void logout() {
    change(null, status: RxStatus.empty());
    Get.offAllNamed(AppRoute.auth.path);
  }
}
