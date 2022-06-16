import 'package:get/get.dart';
import 'package:rodillo_app/features/auth/view/controllers/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
