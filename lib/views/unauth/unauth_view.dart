import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:template/i10n/locale_keys.dart';
import 'package:template/routers/routes.dart';

class UnAuthView extends StatelessWidget {
  const UnAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Center(
        child: OutlinedButton(
          onPressed: () => Get.toNamed(AppRoute.auth.path),
          child: Text(LocaleKeys.authLogin.tr()),
        ),
      ),
    );
  }
}
