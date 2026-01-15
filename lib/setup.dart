import 'package:flutter/material.dart';
import 'package:mwidgets/mwidgets.dart';

import 'src/consts/font_families.dart';

class MWidgetsSetUp {
  static void settings({
    required String fontEn,
    required String fontAr,
    Color? primary,
    Color? secondPrimary,
  }) {
    Coolors.setUp(primary: primary, secondPrimary: secondPrimary);
    FoontFamily.setUp(fontEn: fontEn, fontAr: fontAr);
  }

  static bool isAr = false;

  static void setLocalizations(BuildContext context) {
    isAr = context.isAr;
  }
}
