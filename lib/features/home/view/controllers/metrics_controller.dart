import 'dart:async';

import 'package:get/get.dart';
import 'package:rodillo_app/features/home/view/controllers/calories_controller.dart';
import 'package:rodillo_app/features/home/view/controllers/distance_controller.dart';
import 'package:rodillo_app/features/home/view/controllers/rpm_dart.dart';
import 'package:rodillo_app/features/home/view/controllers/speed_controller.dart';
import 'package:rodillo_app/features/home/view/controllers/time_controller.dart';

class MetricsController extends GetxController {
  //! Controllers
  final CaloriesController caloriesController = Get.put(CaloriesController());
  final DistanceController distanceController = Get.put(DistanceController());
  final RpmController rpmController = Get.put(RpmController());
  final SpeedController speedController = Get.put(SpeedController());
  final TimeController timeController = Get.put(TimeController());

  //! Functions
  Future<void> getAllMetrics() async {
    caloriesController.remoteGetCalories();
    distanceController.remoteGetDistance();
    rpmController.remoteGetRpm();
    speedController.remoteGetSpeed();
    timeController.remoteGetTime();
  }

  Timer? timer;

  @override
  void onReady() async {
    timer = Timer.periodic(
      const Duration(seconds: 10),
      (Timer t) => getAllMetrics(),
    );

    super.onReady();
  }
}
