import 'package:get/get.dart';
import 'package:template/_core/result.dart';
import 'package:template/datasource/remote/rest_data_source.dart';
import 'package:template/datasource/remote/rest_service.dart';
import 'package:template/models/dto/filter_requests/x_list_filter.dart';
import 'package:template/models/dto/pagination_list/pagination_req.dart';
import 'package:template/models/x_data.dart';

mixin XDataRepo {
  static RestDataSource get _dataSource => Get.find<RestService>().dataSource;

  static Future<Result<List<XData>>> getXDataList() async {
    return Result.guardFuture<List<XData>>(() async {
      final res = await _dataSource.getXDataList(
        PaginationRequest(page: 1),
        filter: XListFilter(),
      );
      return res.data;
    });
  }
}
