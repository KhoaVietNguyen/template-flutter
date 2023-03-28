import 'package:get/get.dart';
import 'package:template/_core/result.dart';
import 'package:template/datasource/remote/rest_data_source.dart';
import 'package:template/datasource/remote/rest_service.dart';
import 'package:template/models/s_product.dart';
import 'package:template/resources/constants.dart';

mixin SProductRepo {
  static RestDataSource get _dataSource => Get.find<RestService>().dataSource;

  static Future<Result<List<SProduct>>> getProducts({
    int page = 1,
    int? categoryId,
  }) async {
    return Result.guardFuture<List<SProduct>>(() async {
      final res = await _dataSource.getProducts(
        categoryId: categoryId,
        offset: (page - 1) * Constants.limitPerPage,
        limit: Constants.limitPerPage,
      );
      return res;
    });
  }

  static Future<Result<SProduct>> getProduct(int id) async {
    return Result.guardFuture<SProduct>(() async {
      final res = await _dataSource.getProductDetail(id);
      return res;
    });
  }
}
