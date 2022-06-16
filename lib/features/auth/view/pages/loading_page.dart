import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rodillo_app/config/colors.dart';
import 'package:rodillo_app/features/auth/view/controllers/loading_controller.dart';

class LoadingPage extends GetView<LoadingController> {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
        body: Container(
      color: RodilloColors.blue,
      child: const Center(
        child: CircularProgressIndicator(
          color: RodilloColors.white,
        ),
      ),
    ));
  }
}
