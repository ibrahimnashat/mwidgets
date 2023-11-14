import 'package:flutter/material.dart';

import 'date_time.dart';

extension OnString on String {
  String get toDateOnly => DateTime.tryParse(this)?.dateOnly ?? '';

  String get toDateAndTime => DateTime.tryParse(this)?.nameOfDayAndMonth ?? '';

  String get toNameOfMonthAndTime =>
      DateTime.tryParse(this)?.nameOfMonthAndTime ?? '';

  String ago(BuildContext context) => DateTime.parse(this).timeAgo(context);

  String get toTimeOnly => DateTime.tryParse(this)?.time12Only ?? '';

  String get toMonthAndDay => DateTime.tryParse(this)?.monthAndDay ?? '';

  String get toYearMonthDay => DateTime.tryParse(this)?.birthDateForm ?? '';
}

extension OnNullString on String? {
  String get value => this ?? '';

  String? get clear {
    if (this == '') return null;
    return this;
  }
}
