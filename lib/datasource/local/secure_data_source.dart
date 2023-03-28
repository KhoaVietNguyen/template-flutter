import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureDataSource {
  SecureDataSource() {
    _storage = const FlutterSecureStorage();
  }

  late FlutterSecureStorage _storage;

  final String _keyAccessToken = "access_token";

  Future<void> saveAccessToken(String accessToken) async {
    await _storage.write(
      key: _keyAccessToken,
      value: accessToken,
    );
  }

  Future<String?> getAccessToken() {
    return _storage.read(key: _keyAccessToken);
  }

  Future<void> deleteAllSecureStorage() {
    return _storage.deleteAll();
  }
}
