import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rodillo_app/config/common.dart';
import 'package:rodillo_app/core/widgets/widgets.dart';
import 'package:rodillo_app/features/auth/view/controllers/register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const _Header(),
            RegisterForm1(controller: controller),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: kTopPadding,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            children: [
              Material(
                borderRadius: BorderRadius.circular(100),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: kIconSize,
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Registro",
                    style: Get.textTheme.headline4,
                  )),
              const Spacer(),
            ],
          ),
        )
      ],
    );
  }
}

class RegisterForm1 extends StatelessWidget {
  final RegisterController controller;
  const RegisterForm1({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Form(
        key: controller.formKeyRegister1,
        child: Column(
          children: [
            const SizedBox(height: kTopPadding),
            const CustomSubtitle(text: "Email"),
            CustomInput(
              validationError: "Introduce un email válido",
              placeholder: "Email",
              textController: controller.emailCtrl,
              isEmail: true,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            const CustomSubtitle(text: "Nombre"),
            CustomInput(
              validationError: "Introduce un nombre válido",
              placeholder: "Nombre",
              textController: controller.nameCtrl,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            const CustomSubtitle(text: "Apellido"),
            CustomInput(
              validationError: "Introduce un apellido válido",
              placeholder: "Apellido",
              textController: controller.lastNameCtrl,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 40),
            BlueButton(
                text: "Continuar",
                onPressed: () {
                  controller.validateRegister();
                })
          ],
        ),
      ),
    );
  }
}
