import 'package:freezed_annotation/freezed_annotation.dart';

part 's_category.freezed.dart';
part 's_category.g.dart';

@freezed
class SCategory with _$SCategory {
  factory SCategory({
    required int id,
    String? name,
  }) = _SCategory;

  factory SCategory.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$SCategoryFromJson(json);
}
