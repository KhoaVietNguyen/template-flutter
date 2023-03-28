import 'package:get/get.dart';
import 'package:template/_core/result.dart';
import 'package:template/datasource/remote/rest_data_source.dart';
import 'package:template/datasource/remote/rest_service.dart';
import 'package:template/models/s_category.dart';

mixin SCategoryRepo {
  static RestDataSource get _dataSource => Get.find<RestService>().dataSource;

  static Future<Result<List<SCategory>>> getCategories() async {
    return Result.guardFuture<List<SCategory>>(() async {
      final res = await _dataSource.getCategories();
      return res;
    });
  }
}
