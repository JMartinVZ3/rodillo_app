import 'package:get/get.dart';
import 'package:rodillo_app/features/auth/view/controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
