import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:template/gen/assets.gen.dart';
import 'package:template/i10n/locale_keys.dart';
import 'package:template/models/x_data.dart';
import 'package:template/routers/routes.dart';
import 'package:template/views/auth/controllers/auth_controller.dart';
import 'package:template/views/home/widgets/data_item.dart';
import 'package:template/views/unauth/auth_checker_widget.dart';
import 'package:template/widgets/exception_widget.dart';
import 'package:template/widgets/no_data_widget.dart';

import '../controllers/home_controller.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: Text(
          LocaleKeys.appName.tr(),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(child: Assets.images.kLogo.image()),
        ),
        actions: [
          IconButton(
            onPressed: Get.find<AuthController>().logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: AuthCheckerWidget(
        child: Center(
          child: controller.obx(
            (state) {
              return _buildList(state ?? []);
            },
            onEmpty: const NoDataWidget(),
            onError: (error) => const ExceptionWidget(),
            onLoading: const CircularProgressIndicator(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoute.shopping.path),
        child: const Icon(Icons.store),
      ),
    );
  }

  Widget _buildList(List<XData> list) {
    return ListView.builder(
      itemBuilder: (context, index) => XDataItem(list[index]),
      itemCount: list.length,
    );
  }
}
