// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

/// Estados de la pagina
enum PageState {
  Home,
  Metrics,
  Account,
}

/// Controlador de la pagina de inicio
class MenuController extends GetxController {
  //! Variables
  /// Variable que contiene el estado de las paginas
  Rx<PageState> pageState = PageState.Home.obs;
}
