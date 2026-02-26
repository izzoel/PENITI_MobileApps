import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:peniti_mobile/app/core/services/auth_service.dart';
import 'package:peniti_mobile/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:peniti_mobile/app/routes/app.routes.dart';
import 'app/modules/auth/views/login_view.dart';
import 'app/modules/dashboard/views/dashboard_view.dart';
import 'app/modules/auth/bindings/auth_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  Get.put(AuthService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peniti Tapin',
      initialRoute: '/',
      getPages: [
        GetPage(
          name: Routes.LOGIN,
          page: () => const LoginView(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: Routes.DASHBOARD,
          page: () => const DashboardView(),
          binding: DashboardBinding(),
        ),
      ],
    );
  }
}
