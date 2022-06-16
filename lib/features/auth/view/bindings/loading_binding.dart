import 'package:get/get.dart';
import 'package:rodillo_app/features/auth/view/controllers/loading_controller.dart';

class LoadingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoadingController>(() => LoadingController());
  }
}
