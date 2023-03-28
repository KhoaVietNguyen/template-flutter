import 'dart:ui';

import 'package:sheet_loader_localization/sheet_loader_localization.dart';

part 'locale_keys.g.dart';

@SheetLocalization(
  /// https://docs.google.com/spreadsheets/d/11zbFPrVgWH-sNKUR0VYKV2FwfaXPi2J2B07tlwcsjjg
  docId: '11zbFPrVgWH-sNKUR0VYKV2FwfaXPi2J2B07tlwcsjjg',

  /// The `1` is the generated version.
  /// You must increment it each time you want to
  /// regenerate a new version of the labels.
  version: 1,

  /// Default directory save downloaded CSV file
  outDir: 'assets/languages',

  /// Default CSV file name
  outName: 'languages.csv',

  preservedKeywords: [],
)
// ignore: unused_element
class _LocaleKeys {}
