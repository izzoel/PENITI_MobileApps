import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peniti_mobile/app/core/services/auth_service.dart';
import 'package:peniti_mobile/app/core/utils/snackbar_helper.dart';
import 'package:peniti_mobile/app/routes/app.routes.dart';
import '../providers/auth_provider.dart';

class LoginController extends GetxController {
  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  final isLoading = false.obs;
  final _provider = AuthProvider();
  final _authService = Get.find<AuthService>();

  Future<void> login() async {
    if (emailC.text.isEmpty || passwordC.text.isEmpty) {
      Get.snackbar("Error", "Email dan Password wajib diisi");
      return;
    }

    try {
      isLoading.value = true;

      final result = await _provider.login(emailC.text, passwordC.text);

      final int status = result["status"];
      final body = jsonDecode(result["body"]);

      /// ========================
      /// Kode Status
      if (status == 200) {
        final token = body["data"]?["token"];

        if (token == null) {
          SnackbarHelper.error("Token tidak ditemukan");
          return;
        }

        await _authService.saveToken(token);

        SnackbarHelper.success(body["message"] ?? "Login berhasil");

        Get.offAllNamed(Routes.DASHBOARD);
      } else if (status == 401) {
        SnackbarHelper.error("Email atau password salah");
      } else if (status == 422) {
        SnackbarHelper.warning(body["message"] ?? "Validasi gagal");
      } else if (status >= 500) {
        SnackbarHelper.server("Terjadi kesalahan di server");
      } else {
        SnackbarHelper.error("Terjadi kesalahan ($status)");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }
}
