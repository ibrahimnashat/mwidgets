import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mwidgets/mwidgets.dart';

extension OnDateTime on DateTime {
  String time12Only(BuildContext context) =>
      DateFormat('hh:mm a', context.languageCode).format(this);

  String time24Only(BuildContext context) =>
      DateFormat('HH:mm', context.languageCode).format(this);

  String currentHour(BuildContext context) =>
      DateFormat('hh', context.languageCode).format(this);

  String dateOnly(BuildContext context) =>
      DateFormat('yyyy-MM-dd', context.languageCode).format(this);

  String timeAndDate(BuildContext context) =>
      DateFormat('yyyy-MM-dd hh:mm a', context.languageCode).format(this);

  String current(BuildContext context) =>
      DateFormat('yyyy-MM-dd hh:mm s', context.languageCode).format(this);

  String monthAndDay(BuildContext context) =>
      DateFormat('dd MMM', context.languageCode).format(this);

  String yearMonthDay(BuildContext context) =>
      DateFormat('dd MMM yyyy', context.languageCode).format(this);

  String birthDateForm(BuildContext context) =>
      DateFormat('dd/MM/yyyy', context.languageCode).format(this);

  String nameOfDayAndMonth(BuildContext context) =>
      DateFormat('EEEE, MMM dd', context.languageCode).format(this);

  String nameOfDayAndMonthAndYear(BuildContext context) =>
      DateFormat('EEEE, MMM dd yyyy', context.languageCode).format(this);

  String nameOfMonthAndTime(BuildContext context) =>
      DateFormat('MMM dd hh:mm a', context.languageCode).format(this);

  int get timeStamp => millisecondsSinceEpoch;

  int get timeStampForHours =>
      DateTime(year, 0, 0, hour, minute, second).millisecondsSinceEpoch;

  String timeAgo(BuildContext context) {
    Duration diff = DateTime.now().difference(this);
    Ago messages = context.isAr ? AgoAr() : AgoEn();
    if (diff.inDays > 365) {
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? messages.year : messages.years} ${messages.ago}";
    }
    if (diff.inDays > 30) {
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? messages.month : messages.months} ${messages.ago}";
    }
    if (diff.inDays > 7) {
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? messages.week : messages.weeks} ${messages.ago}";
    }
    if (diff.inDays > 0) {
      return "${diff.inDays} ${diff.inDays == 1 ? messages.day : messages.days} ${messages.ago}";
    }
    if (diff.inHours > 0) {
      return "${diff.inHours} ${diff.inHours == 1 ? messages.hour : messages.hours} ${messages.ago}";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? messages.minute : messages.minutes} ${messages.ago}";
    }
    return messages.justNow;
  }
}

abstract class Ago {
  String get year;

  String get years;

  String get month;

  String get months;

  String get week;

  String get weeks;

  String get day;

  String get days;

  String get hour;

  String get hours;

  String get minute;

  String get minutes;

  String get ago;

  String get justNow;
}

class AgoAr implements Ago {
  @override
  String get ago => 'منذ';

  @override
  String get day => "يوم";

  @override
  String get days => "أيام";

  @override
  String get hour => "ساعة";

  @override
  String get hours => "ساعات";

  @override
  String get minute => "دقيقة";

  @override
  String get minutes => "دقائق";

  @override
  String get month => "شهر";

  @override
  String get months => "أشهر";

  @override
  String get week => "أسبوع";

  @override
  String get weeks => "أسابيع";

  @override
  String get justNow => "الآن";

  @override
  String get year => "سنة";

  @override
  String get years => "سنوات";
}

class AgoEn implements Ago {
  @override
  String get ago => 'ago';

  @override
  String get day => "day";

  @override
  String get days => "days";

  @override
  String get hour => "hour";

  @override
  String get hours => "hours";

  @override
  String get minute => "minute";

  @override
  String get minutes => "minutes";

  @override
  String get month => "month";

  @override
  String get months => "months";

  @override
  String get week => "week";

  @override
  String get weeks => "weeks";

  @override
  String get year => "year";

  @override
  String get years => "years";

  @override
  String get justNow => "just now";
}
