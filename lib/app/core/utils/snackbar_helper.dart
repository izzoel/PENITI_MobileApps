import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  static void success(String message) {
    _show(
      title: "Berhasil",
      message: message,
      color: const Color(0xFF2E7D32),
      icon: Icons.check_circle,
    );
  }

  static void error(String message) {
    _show(
      title: "Error",
      message: message,
      color: const Color(0xFFC62828),
      icon: Icons.error,
    );
  }

  static void warning(String message) {
    _show(
      title: "Peringatan",
      message: message,
      color: const Color(0xFFED6C02),
      icon: Icons.warning,
    );
  }

  static void server(String message) {
    _show(
      title: "Server Error",
      message: message,
      color: const Color(0xFF6A1B9A),
      icon: Icons.cloud_off,
    );
  }

  static void _show({
    required String title,
    required String message,
    required Color color,
    required IconData icon,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
      icon: Icon(icon, color: Colors.white),
      boxShadows: [
        BoxShadow(
          color: Colors.black.withAlpha(60),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}
