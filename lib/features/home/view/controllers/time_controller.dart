// ignore_for_file: constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:rodillo_app/core/error/failure.dart';
import 'package:rodillo_app/core/helpers/helpers.dart';
import 'package:rodillo_app/core/usecases/usecase.dart';
import 'package:rodillo_app/di/injection_container.dart';
import 'package:rodillo_app/features/home/domain/usecases/get_time.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class TimeController extends GetxController with StateMixin<double> {
  //! UseCases
  final GetTime getTime = sl<GetTime>();

  //! UseCase Implementation
  Future<void> remoteGetTime() async {
    change(null, status: RxStatus.loading());

    final Either<Failure, double> result = await getTime.call(NoParams());

    _handleGetTime(result);
  }

  //! UseCase Handler
  // handle api fetch result
  void _handleGetTime(Either<Failure, double> result) {
    result.fold((failure) {
      change(null, status: RxStatus.error(_mapFailureToMessage(failure)));

      showErrorSnackbar(body: _mapFailureToMessage(failure));
    }, (data) {
      change(data, status: RxStatus.success());
    });
  }

  @override
  void onReady() async {
    await remoteGetTime();
    super.onReady();
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}
