import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rodillo_app/config/routes/app_pages.dart';
import 'package:rodillo_app/config/routes/app_routes.dart';
import 'package:rodillo_app/config/themes/light_theme.dart';
import 'package:rodillo_app/core/controllers/helper_controller.dart';
import 'package:rodillo_app/features/auth/view/bindings/loading_binding.dart';
import 'package:rodillo_app/features/auth/view/controllers/user_controller.dart';

import 'di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onReady: () {
        Get.put(UserController());
        Get.put(HelperController());
      },
      debugShowCheckedModeBanner: false,
      title: 'Rodillo',
      theme: lightTheme,
      initialRoute: Routes.LOADING,
      initialBinding: LoadingBinding(),
      getPages: AppPages.pages,
    );
  }
}
