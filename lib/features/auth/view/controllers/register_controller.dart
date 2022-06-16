// ignore_for_file: constant_identifier_names

import 'package:rodillo_app/config/routes/app_routes.dart';
import 'package:rodillo_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rodillo_app/core/helpers/helpers.dart';
import 'package:rodillo_app/di/injection_container.dart';
import 'package:rodillo_app/features/auth/domain/entities/user.dart';
import 'package:rodillo_app/features/auth/domain/usecases/user_register.dart';
import 'package:rodillo_app/features/auth/view/controllers/user_controller.dart';

const String SERVER_FAILURE_MESSAGE = 'Ha ocurrido un error con el servidor';
const String REGISTER_FAILURE_MESSAGE = "El correo ya está registrado";

class RegisterController extends GetxController {
  //! Usecases

  /// Importamos funcion que crea la cuenta del usuario
  final UserRegister userRegister = sl<UserRegister>();

  //! Form Keys
  /// Key con la que validamos el formulario del registro
  final GlobalKey<FormState> formKeyRegister1 = GlobalKey<FormState>();

  /// Key con la que validamos el formulario del registro
  final GlobalKey<FormState> formKeyRegister2 = GlobalKey<FormState>();

  //! Variables
  /// Controlador de texto del email
  final TextEditingController emailCtrl = TextEditingController();

  /// Controlador de texto del password
  final TextEditingController passwordCtrl = TextEditingController();

  /// Controlador de texto del nombre
  final TextEditingController nameCtrl = TextEditingController();

  /// Controlador de texto del nombre de usuario
  final TextEditingController userNameCtrl = TextEditingController();

  /// Controlador de texto del apellido
  final TextEditingController lastNameCtrl = TextEditingController();

  //! Usecases Implementations

  Future<void> remoteUserRegister() async {
    final Either<Failure, User> result =
        await userRegister.call(UserRegisterParams(
      email: emailCtrl.text.trim(),
      password: passwordCtrl.text.trim(),
      name: nameCtrl.text,
      lastName: lastNameCtrl.text,
      userName: userNameCtrl.text.trim(),
    ));

    _handleUserRegister(result);
  }

  //! Handlers

  // handle api fetch result
  void _handleUserRegister(Either<Failure, User> result) {
    result.fold((failure) {
      /// Removemos el showLoading()
      Get.back();

      Get.snackbar('Error', _mapFailureToMessage(failure),
          snackPosition: SnackPosition.BOTTOM);
    }, (data) {
      /// Le pasamos la data obtenida al controlador del motel
      Get.find<UserController>().user = data;

      /// Removemos el showLoading()
      Get.back();

      /// Vamos a la pagina principal de la app
      Get.toNamed(Routes.MENU);
    });
  }

  //! Functions

  /// validar los valores de los controladores de texto
  void validateRegister() async {
    if (formKeyRegister1.currentState!.validate()) {
      Get.toNamed(Routes.REGISTER_INFO);
    } else {
      return;
    }
  }

  Future<void> validateRegisterInfo() async {
    if (formKeyRegister2.currentState!.validate()) {
      showLoading();
      await remoteUserRegister();
    } else {
      return;
    }
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case RegisterFailure:
      return REGISTER_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}
