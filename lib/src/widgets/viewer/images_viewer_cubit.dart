import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mwidgets/src/consts/states.dart';

@injectable
class ImagesViewerCubit extends Cubit<ProcessState> {
  late final TabController tabController;
  late AnimationController animationController;
  late Animation<double> position;
  int index = 0;

  ImagesViewerCubit() : super(SuccessState());

  void init({
    required vsync,
    required int length,
    required int initialIndex,
  }) {
    index = initialIndex;
    animationController = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: vsync,
    );

    position =
        Tween<double>(begin: 16.0, end: 35.0).animate(animationController)
          ..addListener(
            () {
              emit(SuccessState(data: animationController.value));
            },
          );

    tabController =
        TabController(vsync: vsync, length: length, initialIndex: initialIndex)
          ..addListener(
            () async {
              index = tabController.index;
              animationController.reset();
              animationController.forward();
              emit(SuccessState(data: index));
            },
          );
    animationController.forward();
  }

  @override
  Future<void> close() {
    tabController.dispose();
    animationController.dispose();
    return super.close();
  }
}
