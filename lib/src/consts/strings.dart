import 'package:flutter/material.dart';

import 'date_time.dart';

extension OnString on String {
  String toDateOnly(BuildContext context) =>
      DateTime.tryParse(this)?.toLocal().dateOnly(context) ?? '';

  String toTimeAndDate(BuildContext context) =>
      DateTime.tryParse(this)?.toLocal().timeAndDate(context) ?? '';

  String toNameOfDayAndMonthAndYear(BuildContext context) =>
      DateTime.tryParse(this)?.toLocal().nameOfDayAndMonthAndYear(context) ??
      '';

  String toDateAndTime(BuildContext context) =>
      DateTime.tryParse(this)?.toLocal().nameOfDayAndMonth(context) ?? '';

  String toNameOfMonthAndTime(BuildContext context) =>
      DateTime.tryParse(this)?.toLocal().nameOfMonthAndTime(context) ?? '';

  String ago(BuildContext context) =>
      DateTime.parse(this).toLocal().timeAgo(context);

  String toTimeOnly(BuildContext context) =>
      DateTime.tryParse(this)?.toLocal().time12Only(context) ?? '';

  String toMonthAndDay(BuildContext context) =>
      DateTime.tryParse(this)?.toLocal().monthAndDay(context) ?? '';

  String toYearMonthDay(BuildContext context) =>
      DateTime.tryParse(this)?.toLocal().birthDateForm(context) ?? '';
}

extension OnNullString on String? {
  String get value => this ?? '';

  String? get clear {
    if (this == '') return null;
    return this;
  }
}
