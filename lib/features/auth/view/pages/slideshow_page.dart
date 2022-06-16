import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rodillo_app/config/colors.dart';
import 'package:rodillo_app/config/constants.dart';
import 'package:rodillo_app/config/routes/app_routes.dart';
import 'package:rodillo_app/core/widgets/widgets.dart';
import 'package:rodillo_app/features/auth/view/controllers/slideshow_controller.dart';
import 'package:rodillo_app/features/auth/view/widgets/widgets.dart';

/// Pagina en la que se verifica si el usuario ha iniciado sesion.

class SlideshowPage extends GetView<SlideshowController> {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: RodilloColors.white,
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
                top: 40,
                bottom: 20,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Bike Tek',
                  style: Get.textTheme.headline1!
                      .copyWith(color: RodilloColors.black),
                ),
              ),
            ),
            const Expanded(child: MySlideshow()),
            const BotonesDeInicio(),
          ],
        ));
  }
}

class MySlideshow extends StatelessWidget {
  const MySlideshow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario: 14,
      bulletSecundario: 14,
      colorPrimario: RodilloColors.black,
      colorSecundario: Colors.grey[350]!,
      slides: <Widget>[
        CustomSlide(
          widget: Text(
            "R",
            style: Get.textTheme.headline1!
                .copyWith(fontSize: 240, color: RodilloColors.blue),
          ),
          title: 'Mejor Rodillo',
        ),
        CustomSlide(
          widget: Text(
            "R",
            style: Get.textTheme.headline1!
                .copyWith(fontSize: 240, color: RodilloColors.blue),
          ),
          title: 'Mejor Rodillo',
        ),
        CustomSlide(
          widget: Text(
            "R",
            style: Get.textTheme.headline1!
                .copyWith(fontSize: 240, color: RodilloColors.blue),
          ),
          title: 'Mejor Rodillo',
        ),
      ],
    );
  }
}

class BotonesDeInicio extends StatelessWidget {
  const BotonesDeInicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          BlueButton(
            text: 'Registrarse',
            onPressed: () {
              Get.toNamed(Routes.REGISTER);
            },
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.LOGIN);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Ya tienes una cuenta?",
                    style: Get.textTheme.bodyText2!.copyWith(
                      fontSize: 12,
                    )),
                const SizedBox(
                  width: kDefaultPadding / 6,
                ),
                Text(
                  "Inicia Sesión",
                  style: Get.textTheme.bodyText1!.copyWith(
                    color: RodilloColors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: kDefaultPadding * 2,
          ),
        ],
      ),
    );
  }
}
