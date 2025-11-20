import 'package:flutter/material.dart';

import 'date_time.dart';

extension OnString on String {
  String get toDateOnly => DateTime.tryParse(this)?.toLocal().dateOnly ?? '';

  String get toTimeAndDate =>
      DateTime.tryParse(this)?.toLocal().timeAndDate ?? '';

  String get toNameOfDayAndMonthAndYear =>
      DateTime.tryParse(this)?.toLocal().nameOfDayAndMonthAndYear ?? '';

  String get toDateAndTime =>
      DateTime.tryParse(this)?.toLocal().nameOfDayAndMonth ?? '';

  String get toNameOfMonthAndTime =>
      DateTime.tryParse(this)?.toLocal().nameOfMonthAndTime ?? '';

  String ago(BuildContext context) =>
      DateTime.parse(this).toLocal().timeAgo(context);

  String get toTimeOnly => DateTime.tryParse(this)?.toLocal().time12Only ?? '';

  String get toMonthAndDay =>
      DateTime.tryParse(this)?.toLocal().monthAndDay ?? '';

  String get toYearMonthDay =>
      DateTime.tryParse(this)?.toLocal().birthDateForm ?? '';
}

extension OnNullString on String? {
  String get value => this ?? '';

  String? get clear {
    if (this == '') return null;
    return this;
  }
}
