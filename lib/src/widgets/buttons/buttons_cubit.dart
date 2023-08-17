import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mwidgets/src/consts/states.dart';

@injectable
class ButtonsCubit extends Cubit<ProcessState> {
  late final AnimationController controller;
  late final AnimationController controllerScale;
  Animation<double>? tweenButton;
  double width = 0;
  ButtonsCubit() : super(SuccessState());

  void init(vsync, {double width = 200.0}) {
    this.width = width;
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 500),
    );
    controllerScale = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 400),
    );
    tweenButton = Tween<double>(begin: width, end: 35.0).animate(controller);
  }

  void done() async {
    final scaleWidth = width * 1.1;
    tweenButton =
        Tween<double>(begin: width, end: scaleWidth).animate(controllerScale)
          ..addListener(() {
            emit(SuccessState(data: DateTime.now().toIso8601String()));
          });
    await controllerScale.forward();
    tweenButton = Tween<double>(begin: scaleWidth, end: 30).animate(controller)
      ..addListener(() {
        emit(SuccessState(data: DateTime.now().toIso8601String()));
      });
    await controller.forward();
  }

  @override
  Future<void> close() {
    controllerScale.removeListener(() {});
    controller.removeListener(() {});
    controllerScale.dispose();
    controller.dispose();
    return super.close();
  }
}
