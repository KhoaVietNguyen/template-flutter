import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:template/i10n/locale_keys.dart';
import 'package:template/models/s_product.dart';
import 'package:template/routers/routes.dart';
import 'package:template/views/store/product_list/widgets/product_item.dart';
import 'package:template/widgets/common_paged_list.dart';
import 'package:template/widgets/exception_widget.dart';
import 'package:template/widgets/no_data_widget.dart';

import '../controllers/product_list_controller.dart';

class ProductListPage extends GetWidget<ProductListController> {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.appName.tr(),
        ),
      ),
      body: _pagingControllerMethodList(context),
    );
  }

  @Deprecated('Should use paging method')
  Widget _stateMethodList(BuildContext context) {
    return Center(
      child: controller.obx(
        (state) => ListView.builder(
          itemBuilder: (context, index) => ProductItem(
            state![index],
            onTap: () => _onDetail(context, state[index]),
          ),
          itemCount: state?.length,
        ),
        onEmpty: const NoDataWidget(),
        onError: (error) => const ExceptionWidget(),
        onLoading: const CircularProgressIndicator(),
      ),
    );
  }

  Widget _pagingControllerMethodList(BuildContext context) {
    return CommonPagedList<SProduct>(
      pagingController: controller.pagingCtrler,
      itemBuilder: (context, item, index) => ProductItem(
        item,
        onTap: () => _onDetail(context, item),
      ),
    );
  }

  void _onDetail(BuildContext context, SProduct product) {
    Get.toNamed(
      AppRoute.product.path,
      arguments: {'id': product.id, 'title': product.title},
    );
  }
}
