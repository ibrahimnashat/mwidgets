// ignore_for_file: overridden_fields, must_be_immutable

import 'package:flutter/material.dart';

class MBorderRadius extends BorderRadiusDirectional {
  MBorderRadius.set({
    topStart = 0.0,
    topEnd = 0.0,
    bottomEnd = 0.0,
    bottomStart = 0.0,
    start = 0.0,
    end = 0.0,
    top = 0.0,
    bottom = 0.0,
    all = 0.0,
  }) : super.only(
          topStart: Radius.circular(topStart + start + all + top),
          topEnd: Radius.circular(topEnd + end + all + top),
          bottomStart: Radius.circular(bottomStart + start + all + bottom),
          bottomEnd: Radius.circular(bottomEnd + end + all + bottom),
        );
}
