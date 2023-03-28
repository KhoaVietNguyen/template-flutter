import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/datasource/local/secure_service.dart';
import 'package:template/datasource/remote/rest_service.dart';
import 'package:template/i10n/locale_keys.dart';
import 'package:template/resources/themes.dart';
import 'package:template/routers/routes.dart';
import 'package:template/services/crashlytics.dart';
import 'package:template/views/auth/controllers/auth_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize Localization
  await EasyLocalization.ensureInitialized();

  /// Initialize Firebase
  // await Firebase.initializeApp();

  /// Firebase Crashlytics
  // Crashlytics.init();

  await runZonedGuarded<Future<void>>(
    () async {
      await SecureService.init();
      await RestService.init();
      runApp(
        EasyLocalization(
          supportedLocales: LocaleKeys.supportedLocales,
          startLocale: LocaleKeys.supportedLocales.first,
          path: 'assets/languages/languages.csv',
          assetLoader: CsvAssetLoader(),
          child: const MyApp(),
        ),
      );
    },
    Crashlytics.recordError,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.light,
      initialBinding: AuthBinding(),
      getPages: appPages,
      initialRoute: AppRoute.home.path,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
