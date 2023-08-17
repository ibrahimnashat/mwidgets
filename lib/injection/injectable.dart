import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@module
abstract class InjectionModule {
  @injectable
  GlobalKey<NavigatorState> get nav => GlobalKey<NavigatorState>();

  @injectable
  Random get random => Random();

  @injectable
  TextEditingController get textEditingController => TextEditingController();

  @injectable
  ScrollController get scrollController => ScrollController();

  @injectable
  String get string => '';

  @injectable
  List<String> get strings => [];

  @injectable
  int get number => 0;

  @injectable
  GlobalKey<FormState> get globalKey => GlobalKey<FormState>();
}
