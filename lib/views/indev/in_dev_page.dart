import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:template/i10n/locale_keys.dart';

class InDevPage extends StatelessWidget {
  const InDevPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.appName.tr()),
      ),
      body: const Center(
        child: Icon(Icons.construction),
      ),
    );
  }
}
