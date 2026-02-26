import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:peniti_mobile/app/routes/app.routes.dart';

class AuthService extends GetxService {
  final _box = GetStorage();

  static const _tokenKey = 'token';

  /// ========================
  /// Simpan Token
  Future<void> saveToken(String token) async {
    await _box.write(_tokenKey, token);
  }

  /// ========================
  /// Ambil Token
  String? get token => _box.read(_tokenKey);

  /// ========================
  /// Cek Login
  bool get isLoggedIn => token != null;

  /// ========================
  /// Logout
  Future<void> logout() async {
    await _box.remove(_tokenKey);
    Get.offAllNamed(Routes.LOGIN);
  }
}
