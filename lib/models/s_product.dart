import 'package:freezed_annotation/freezed_annotation.dart';

part 's_product.freezed.dart';
part 's_product.g.dart';

@freezed
class SProduct with _$SProduct {
  factory SProduct({
    required int id,
    String? title,
    double? price,
    String? creationAt,
  }) = _SProduct;

  factory SProduct.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$SProductFromJson(json);
}
