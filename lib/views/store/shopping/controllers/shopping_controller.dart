import 'package:get/get.dart';
import 'package:template/models/s_category.dart';
import 'package:template/repositories/s_product_repo.dart';

class ShoppingController extends GetxController
    with StateMixin<List<SCategory>> {
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch({int page = 1}) async {
    final result = await SCategoryRepo.getCategories();

    result.when(
      success: (data) => change(
        data,
        status: data.isEmpty ? RxStatus.empty() : RxStatus.success(),
      ),
      failure: (error) => change(null, status: RxStatus.error(error.message)),
    );
  }
}
