import 'package:get/get.dart';

import 'dio_client.dart';
import 'rest_data_source.dart';

class RestService extends GetxService {
  /// Fake api source: https://fakeapi.platzi.com/
  static const baseUrl = 'https://api.escuelajs.co/api/v1';

  static Future init() async {
    await Get.putAsync(
      () async => RestService(RestDataSource(DioClient(baseUrl: baseUrl))),
    );
  }

  RestService(this.dataSource);

  final RestDataSource dataSource;
}
