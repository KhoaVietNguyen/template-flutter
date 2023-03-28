import 'dart:core';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:template/models/dto/filter_requests/x_list_filter.dart';
import 'package:template/models/dto/pagination_list/pagination_req.dart';
import 'package:template/models/dto/pagination_list/pagination_res.dart';
import 'package:template/models/s_category.dart';
import 'package:template/models/s_product.dart';
import 'package:template/models/x_data.dart';

part 'rest_data_source.g.dart';

@RestApi()
abstract class RestDataSource {
  factory RestDataSource(Dio dio) = _RestDataSource;

  /// ============================================================
  /// Example
  /// ============================================================

  @GET('/list')
  Future<PaginationListResponse<XData>> getXDataList(
    @Queries() PaginationRequest paginationRequest, {
    @Queries() required XListFilter filter,
    @Query('state') String? state,
  });

  @GET('/detail/{id}')
  Future<void> getXDataDetail(
    @Path() int id,
  );

  @POST('/update/{id}')
  Future<void> updateXData(
    @Path() int id, {
    @Body() required XData data,
  });

  /// ============================================================
  /// Store
  /// ============================================================

  @GET('/categories')
  Future<List<SCategory>> getCategories();

  @GET('/products')
  Future<List<SProduct>> getProducts({
    @Query('categoryId') int? categoryId,
    @Query('offset') int? offset,
    @Query('limit') int? limit,
  });

  @GET('/products/{id}')
  Future<SProduct> getProductDetail(@Path() int id);

  /// ============================================================
  /// Others
  /// ============================================================

  // ...
}
