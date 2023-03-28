import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
mixin Constants {
  static const playStoreUrl =
      'https://play.google.com/store/apps/details?id=__.___.____';
  static const appStoreUrl = 'https://apps.apple.com/jp/app/id_________';
  static const termsUrl = "https://example.com/terms";
  static const privacyUrl = "https://example.com/privacy";

  /// firstPageKey of PageController
  static const firstPageKey = 1;

  /// Limit per page
  static const limitPerPage = 20;
}
