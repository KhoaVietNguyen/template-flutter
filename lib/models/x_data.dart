import 'package:freezed_annotation/freezed_annotation.dart';

part 'x_data.freezed.dart';
part 'x_data.g.dart';

@freezed
class XData with _$XData {
  factory XData({
    required int id,
    String? name,
  }) = _XData;

  factory XData.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$XDataFromJson(json);
}
