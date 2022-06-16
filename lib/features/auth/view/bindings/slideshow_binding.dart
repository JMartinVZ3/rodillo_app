import 'package:get/get.dart';
import 'package:rodillo_app/features/auth/view/controllers/slideshow_controller.dart';

class SlideshowBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SlideshowController>(() => SlideshowController());
  }
}
