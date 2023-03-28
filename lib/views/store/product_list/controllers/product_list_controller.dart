import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:template/models/s_product.dart';
import 'package:template/repositories/s_category_repo.dart';
import 'package:template/resources/constants.dart';

class ProductListController extends GetxController
    with StateMixin<List<SProduct>> {
  /// (Example) load more with [pagingCtrler]
  /// [ProductListController] will not need state anymore to manage data
  /// Choose one from 2 method only
  late final PagingController<int, SProduct> pagingCtrler;

  @override
  void onInit() {
    super.onInit();
    pagingCtrler = PagingController(firstPageKey: Constants.firstPageKey);
    pagingCtrler.addPageRequestListener(
      (page) {
        Future.microtask(() => fetch(page: page));
      }
        ..call(Constants.firstPageKey),
    );
  }

  @override
  void onClose() {
    pagingCtrler.dispose();
    super.onClose();
  }

  void fetch({int page = 1}) async {
    final result = await SProductRepo.getProducts(page: page);

    result.when(
      success: (data) {
        // use paging controller method
        if (data.isEmpty) {
          pagingCtrler.appendLastPage(data);
        } else {
          pagingCtrler.appendPage(data, page + 1);
        }

        // use state data method
        change(
          (state ?? [])..addAll(data),
          status: data.isEmpty ? RxStatus.empty() : RxStatus.success(),
        );
      },
      failure: (error) {
        // use paging controller method
        pagingCtrler.error = error.message;

        // use state data method
        change(null, status: RxStatus.error(error.message));
      },
    );
  }
}
