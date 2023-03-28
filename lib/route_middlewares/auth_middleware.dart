import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:template/routers/routes.dart';
import 'package:template/views/auth/controllers/auth_controller.dart';

class AuthMiddleware extends GetMiddleware {
  AuthMiddleware({super.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (Get.find<AuthController>().authenticated) {
      return null;
    }
    return RouteSettings(name: AppRoute.auth.path);
  }
}
