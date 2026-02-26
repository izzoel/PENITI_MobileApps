import 'package:get/get.dart';
import 'package:peniti_mobile/app/core/services/auth_service.dart';

class DashboardController extends GetxController {
  final _authService = Get.find<AuthService>();
  var currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }

  Future<void> logout() async {
    await _authService.logout();
  }
}
