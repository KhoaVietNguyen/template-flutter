import 'package:get/get.dart';
import 'package:template/datasource/local/secure_data_source.dart';
import 'package:template/datasource/local/secure_service.dart';

mixin AuthRepo {
  static SecureDataSource get _localDataSource =>
      Get.find<SecureService>().dataSource;

  static Future<String?> getAccessToken() async {
    return _localDataSource.getAccessToken();
  }
}
