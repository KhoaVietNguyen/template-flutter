import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:template/i10n/locale_keys.dart';
import 'package:template/views/x/widgets/x_item.dart';

import '../controllers/x_controller.dart';

class XPage extends GetWidget<XController> {
  const XPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.appName.tr(),
        ),
      ),
      body: Center(
        child: Column(
          children: const [
            XItem(),
            Icon(Icons.error),
          ],
        ),
      ),
    );
  }
}
