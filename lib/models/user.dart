import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class MUser with _$MUser {
  factory MUser({
    required int id,
    String? name,
    String? email,
    String? password,
  }) = _MUser;

  factory MUser.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MUserFromJson(json);
}
