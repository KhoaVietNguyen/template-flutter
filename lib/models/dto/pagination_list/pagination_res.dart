import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_res.freezed.dart';
part 'pagination_res.g.dart';

@Freezed(genericArgumentFactories: true)
class PaginationListResponse<T> with _$PaginationListResponse<T> {
  factory PaginationListResponse({
    required Pagination pagination,
    required List<T> data,
  }) = _PaginationListResponse<T>;

  factory PaginationListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$PaginationListResponseFromJson(json, fromJsonT);
}

@Freezed(genericArgumentFactories: true)
class ListResponse<T> with _$ListResponse<T> {
  factory ListResponse({
    required List<T> data,
  }) = _ListResponse<T>;

  factory ListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ListResponseFromJson(json, fromJsonT);
}

@freezed
class Pagination with _$Pagination {
  factory Pagination({
    required int pageCount,
    required int currentPage,
    required bool hasNextPage,
    required bool hasPrevPage,
    required int count,
    required int limit,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}
