import 'package:flutter/material.dart';
import 'package:mwidgets/injection/injectable.dart';

import 'src/consts/colors.dart';
import 'src/consts/font_families.dart';

class MWidgetsSetUp {
  static void settings({
    required String fontEn,
    required String fontAr,
    Color? primary,
    Color? secondPrimary,
  }) {
    configureDependencies();
    Coolors.setUp(primary: primary, secondPrimary: secondPrimary);
    FoontFamily.setUp(fontEn: fontEn, fontAr: fontAr);
  }
}
