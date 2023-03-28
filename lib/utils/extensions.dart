import 'package:easy_localization/easy_localization.dart';

extension DateTimeExt on DateTime {
  String toYYYYMMDD() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}
