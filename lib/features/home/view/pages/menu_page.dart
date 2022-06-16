import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rodillo_app/config/common.dart';
import 'package:rodillo_app/features/home/view/controllers/menu_controller.dart';
import 'package:rodillo_app/features/home/view/pages/account_page.dart';
import 'package:rodillo_app/features/home/view/pages/home_page.dart';
import 'package:rodillo_app/features/home/view/pages/metrics_page.dart';

class MenuPage extends GetView<MenuController> {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Paginas(
        controller: controller,
      ),
      bottomNavigationBar: _Navigation(controller: controller),
    );
  }
}

class _Navigation extends StatelessWidget {
  final MenuController controller;

  const _Navigation({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 65,
        decoration: BoxDecoration(
          color: RodilloColors.white,
          borderRadius: BorderRadius.circular(kBorderRadius),
          border: Border.all(
            color: RodilloColors.white,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 5,
              color: RodilloColors.blue.withOpacity(0.05),
              offset: const Offset(0.0, 0.0),
            )
          ],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: IconButton(
                splashRadius: 0.1,
                iconSize: kIconSize,
                icon: Obx(
                  () => Icon(
                    Icons.dashboard_rounded,
                    color: controller.pageState.value == PageState.Home
                        ? RodilloColors.blue
                        : RodilloColors.grey,
                  ),
                ),
                onPressed: () {
                  controller.pageState.value = PageState.Home;
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                splashRadius: 0.1,
                iconSize: kIconSize,
                icon: Obx(
                  () => Icon(
                    Icons.pedal_bike_rounded,
                    color: controller.pageState.value == PageState.Metrics
                        ? RodilloColors.blue
                        : RodilloColors.grey,
                  ),
                ),
                onPressed: () {
                  controller.pageState.value = PageState.Metrics;
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                splashRadius: 0.1,
                iconSize: kIconSize,
                icon: Obx(
                  () => Icon(
                    Icons.person,
                    color: controller.pageState.value == PageState.Account
                        ? RodilloColors.blue
                        : RodilloColors.grey,
                  ),
                ),
                onPressed: () {
                  controller.pageState.value = PageState.Account;
                },
              ),
            ),
          ],
        ));
  }
}

class _Paginas extends StatelessWidget {
  final MenuController controller;

  const _Paginas({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.pageState.value) {
        case PageState.Home:
          return const HomePage();

        case PageState.Metrics:
          return const MetricsPage();

        case PageState.Account:
          return const AccountPage();

        default:
          return const HomePage();
      }
    });
  }
}
