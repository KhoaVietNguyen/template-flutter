import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/views/auth/controllers/auth_controller.dart';
import 'package:template/views/unauth/unauth_view.dart';

class AuthCheckerWidget extends StatelessWidget {
  final Widget child;
  final Widget? unauthenticatedChild;

  const AuthCheckerWidget({
    super.key,
    required this.child,
    this.unauthenticatedChild,
  });

  @override
  Widget build(BuildContext context) {
    if (Get.find<AuthController>().authenticated) {
      return child;
    }
    return unauthenticatedChild ?? const UnAuthView();
  }
}
