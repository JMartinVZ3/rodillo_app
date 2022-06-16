import 'package:get/get.dart';
import 'package:rodillo_app/features/auth/view/bindings/login_binding.dart';
import 'package:rodillo_app/features/auth/view/bindings/register_binding.dart';
import 'package:rodillo_app/features/auth/view/bindings/slideshow_binding.dart';
import 'package:rodillo_app/features/auth/view/pages/loading_page.dart';
import 'package:rodillo_app/features/auth/view/pages/login_page.dart';
import 'package:rodillo_app/features/auth/view/pages/register_info_page.dart';
import 'package:rodillo_app/features/auth/view/pages/register_page.dart';
import 'package:rodillo_app/features/auth/view/pages/slideshow_page.dart';
import 'package:rodillo_app/features/home/view/bindings/menu_binding.dart';
import 'package:rodillo_app/features/home/view/pages/menu_page.dart';

import 'app_routes.dart';

abstract class AppPages {
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    ///==============AUTH===========///
    GetPage<dynamic>(
      name: Routes.LOADING,
      page: () => const LoadingPage(),
    ),

    GetPage<dynamic>(
      name: Routes.SLIDESHOW,
      page: () => const SlideshowPage(),
      transition: Transition.native,
      binding: SlideshowBinding(),
    ),

    GetPage<dynamic>(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      transition: Transition.native,
      binding: LoginBinding(),
    ),

    GetPage<dynamic>(
      name: Routes.REGISTER,
      page: () => const RegisterPage(),
      transition: Transition.native,
      binding: RegisterBinding(),
    ),

    GetPage<dynamic>(
      name: Routes.REGISTER_INFO,
      page: () => const RegisterInfoPage(),
      transition: Transition.native,
      binding: RegisterBinding(),
    ),

    ///==============HOME===========///

    GetPage<dynamic>(
      name: Routes.MENU,
      page: () => const MenuPage(),
      transition: Transition.native,
      binding: MenuBinding(),
    ),
  ];
}
