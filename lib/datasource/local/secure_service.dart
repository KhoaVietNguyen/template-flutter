import 'package:get/get.dart';

import 'secure_data_source.dart';

class SecureService extends GetxService {
  static Future init() async {
    await Get.putAsync(
      () async => SecureService(SecureDataSource()),
    );
  }

  SecureService(this.dataSource);

  final SecureDataSource dataSource;
}
