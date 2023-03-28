import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:template/i10n/locale_keys.dart';
import 'package:template/models/s_category.dart';
import 'package:template/routers/routes.dart';
import 'package:template/views/store/shopping/widgets/category_item.dart';
import 'package:template/widgets/exception_widget.dart';
import 'package:template/widgets/no_data_widget.dart';

import '../controllers/shopping_controller.dart';

class ShoppingPage extends GetWidget<ShoppingController> {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.appName.tr(),
        ),
      ),
      body: Center(
        child: controller.obx(
          (state) => ListView.builder(
            itemBuilder: (context, index) => CategoryItem(
              state![index],
              onTap: () => _onDetail(context, state[index]),
            ),
            itemCount: state?.length,
          ),
          onEmpty: const NoDataWidget(),
          onError: (error) => const ExceptionWidget(),
          onLoading: const CircularProgressIndicator(),
        ),
      ),
    );
  }

  void _onDetail(BuildContext context, SCategory category) {
    Get.toNamed(AppRoute.products.path, arguments: {'id': category.id});
  }
}
