import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:template/utils/currency_format.dart';
import 'package:template/widgets/exception_widget.dart';
import 'package:template/widgets/no_data_widget.dart';

import '../controllers/product_detail_controller.dart';

class ProductDetailPage extends GetWidget<ProductDetailController> {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.productName,
        ),
      ),
      body: Center(
        child: controller.obx(
          (state) => ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.image),
                title: Text(state?.title ?? ''),
              ),
              ListTile(
                leading: const Icon(Icons.monetization_on),
                title: Text(state?.price?.toVNCurrency() ?? ''),
              ),
            ],
          ),
          onEmpty: const NoDataWidget(),
          onError: (error) => const ExceptionWidget(),
          onLoading: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
