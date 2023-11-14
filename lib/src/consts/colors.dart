import 'package:flutter/material.dart';

class Coolors {
  static Color primaryColor = const Color(0xffFAAF41);
  static Color subPrimaryColor = primaryColor.withOpacity(0.3);
  static Color secondPrimaryColor = const Color(0xff3B3561);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color highlight = Color(0xffEFEFEF);
  static Color get highlight2 => Colors.grey.withOpacity(0.5);
  static const Color transparent = Colors.transparent;
  static const Color highlightAccent = Color(0xffF7F7F7);
  static const Color grey = Color(0xFF9A9A9A);
  static const Color dividerColor = Color(0xffDDDDDD);
  static const Color borderColor = Color(0xffDDDDDD);
  static const Color backgroundColor = Color(0xffF7F7F7);
  static const Color red = Color(0xFFF03637);
  static const Color redVenetian = Color(0xFFD1345B);
  static const Color orange = Color(0xffFFAE42);
  static const Color blue = Color(0xff2F97D1);
  static Color yellow = const Color(0xffFFF000);
  static const Color green = Color(0xff3DC03C);
  static const Color greenAccent = Color(0xff69995D);

  static void setUp({Color? primary, Color? secondPrimary}) {
    if (primary != null) primaryColor = primary;
    if (secondPrimary != null) secondPrimaryColor = secondPrimary;
  }
}
