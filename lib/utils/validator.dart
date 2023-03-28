import 'package:easy_localization/easy_localization.dart';
import 'package:template/i10n/locale_keys.dart';

abstract class Validator {
  static String? validate(String? value, {String fieldName = ''}) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.formRequired.tr(args: [fieldName]);
    }
    return null;
  }
}
