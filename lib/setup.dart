import 'package:flutter/material.dart';

import 'src/consts/colors.dart';
import 'src/consts/font_families.dart';

class MWidgetsSetUp {
  static void settings({
    required String fontEn,
    required String fontAr,
    Color? primary,
    Color? secondPrimary,
  }) {
    Coolors.setUp(primary: primary, secondPrimary: secondPrimary);
    FoontFamily.setUp(en: fontEn, ar: fontAr);
  }
}
