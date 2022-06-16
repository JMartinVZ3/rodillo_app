import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rodillo_app/config/common.dart';
import 'package:rodillo_app/features/home/view/controllers/calories_controller.dart';
import 'package:rodillo_app/features/home/view/controllers/distance_controller.dart';
import 'package:rodillo_app/features/home/view/controllers/metrics_controller.dart';
import 'package:rodillo_app/features/home/view/controllers/rpm_dart.dart';
import 'package:rodillo_app/features/home/view/controllers/speed_controller.dart';
import 'package:rodillo_app/features/home/view/controllers/time_controller.dart';

class MetricsPage extends StatelessWidget {
  const MetricsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MetricsController controller = Get.put(MetricsController());

    final CaloriesController caloriesController = Get.put(CaloriesController());
    final DistanceController distanceController = Get.put(DistanceController());
    final RpmController rpmController = Get.put(RpmController());
    final SpeedController speedController = Get.put(SpeedController());
    final TimeController timeController = Get.put(TimeController());

    return RefreshIndicator(
      onRefresh: () async {
        await controller.getAllMetrics();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: kTopPadding,
            ),
            SizedBox(
              height: 150,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: RodilloColors.blue,
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          boxShadow: [
                            BoxShadow(
                              color: RodilloColors.blue.withOpacity(0.2),
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Velocidad",
                                style: Get.textTheme.bodyText2!
                                    .copyWith(color: Colors.white),
                              ),
                              speedController.obx(
                                (state) {
                                  if (state != null) {
                                    return Text(
                                      state.toStringAsFixed(2) + " Km/h",
                                      style: Get.textTheme.bodyText1!.copyWith(
                                          color: Colors.white, fontSize: 24),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                                onEmpty: Container(),
                                onError: (error) => Container(),
                                onLoading: Container(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: RodilloColors.blue,
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          boxShadow: [
                            BoxShadow(
                              color: RodilloColors.blue.withOpacity(0.2),
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Tiempo",
                                style: Get.textTheme.bodyText2!
                                    .copyWith(color: Colors.white),
                              ),
                              timeController.obx(
                                (state) {
                                  if (state != null) {
                                    return Text(
                                      state.toStringAsFixed(1) + " Min",
                                      style: Get.textTheme.bodyText1!.copyWith(
                                          color: Colors.white, fontSize: 24),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                                onEmpty: Container(),
                                onError: (error) => Container(),
                                onLoading: Container(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 150,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: RodilloColors.blue,
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          boxShadow: [
                            BoxShadow(
                              color: RodilloColors.blue.withOpacity(0.2),
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Distancia",
                                style: Get.textTheme.bodyText2!
                                    .copyWith(color: Colors.white),
                              ),
                              distanceController.obx(
                                (state) {
                                  if (state != null) {
                                    return Text(
                                      state.toStringAsFixed(3) + " Km",
                                      style: Get.textTheme.bodyText1!.copyWith(
                                          color: Colors.white, fontSize: 24),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                                onEmpty: Container(),
                                onError: (error) => Container(),
                                onLoading: Container(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: RodilloColors.blue,
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          boxShadow: [
                            BoxShadow(
                              color: RodilloColors.blue.withOpacity(0.2),
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Calorías",
                                style: Get.textTheme.bodyText2!
                                    .copyWith(color: Colors.white),
                              ),
                              caloriesController.obx(
                                (state) {
                                  if (state != null) {
                                    return Text(
                                      state.toStringAsFixed(3),
                                      style: Get.textTheme.bodyText1!.copyWith(
                                          color: Colors.white, fontSize: 24),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                                onEmpty: Container(),
                                onError: (error) => Container(),
                                onLoading: Container(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    color: RodilloColors.blue,
                  ),
                  child: Center(
                    child: rpmController.obx(
                      (state) {
                        if (state != null) {
                          return Text(
                            state.toStringAsFixed(2) + " Rpm",
                            style: Get.textTheme.headline1!.copyWith(
                              color: RodilloColors.white,
                              fontSize: 54,
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                      onEmpty: Container(),
                      onError: (error) => Container(),
                      onLoading: Container(),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
