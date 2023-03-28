import 'package:get/get.dart';
import 'package:template/models/x_data.dart';
import 'package:template/repositories/x_data_repo.dart';

class HomeController extends GetxController with StateMixin<List<XData>> {
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  Future<void> fetch() async {
    change(state, status: RxStatus.loading());
    final result = await XDataRepo.getXDataList();
    result.when(
      success: (data) {
        change(data, status: RxStatus.success());
      },
      failure: (failure) {
        change(null, status: RxStatus.error(failure.message));
      },
    );
  }
}
