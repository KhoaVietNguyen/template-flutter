import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:template/i10n/locale_keys.dart';
import 'package:template/widgets/common_text_form_field.dart';
import 'package:template/widgets/gap.dart';
import 'package:template/widgets/loading_widget.dart';

import '../controllers/auth_controller.dart';

class AuthPage extends GetWidget<AuthController> {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.appName.tr(),
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: controller.isLoading.value,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                CommonTextFormField(
                  controller: controller.emailCtrler,
                  label: 'Email',
                  isRequired: true,
                  keyboardType: TextInputType.emailAddress,
                ),
                Gap.gap16v,
                Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () => _onSubmit(context),
                    child: Text(
                      LocaleKeys.authLogin.tr(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSubmit(BuildContext context) {
    if (Form.of(context).validate()) {
      controller.submit();
    }
  }
}
