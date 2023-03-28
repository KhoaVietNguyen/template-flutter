import 'package:get/get.dart';
import 'package:template/models/s_product.dart';
import 'package:template/repositories/s_category_repo.dart';

class ProductDetailController extends GetxController with StateMixin<SProduct> {
  late int id;
  late String productName;

  @override
  void onInit() {
    super.onInit();

    id = Get.arguments['id'] ?? -1;
    productName = Get.arguments['title'] ?? '';
    fetch();
  }

  Future<void> fetch() async {
    if (id == -1) {
      change(null, status: RxStatus.error());
    }

    final result = await SProductRepo.getProduct(id);

    result.when(
      success: (data) => change(data, status: RxStatus.success()),
      failure: (error) => change(null, status: RxStatus.error(error.message)),
    );
  }
}
