import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_req.freezed.dart';
part 'pagination_req.g.dart';

@freezed
class PaginationRequest with _$PaginationRequest {
  factory PaginationRequest({
    @Default(_limit) int limit,
    required int page,
  }) = _PaginationRequest;

  factory PaginationRequest.fromJson(Map<String, dynamic> json) =>
      _$PaginationRequestFromJson(json);
}

const int _limit = 20;
