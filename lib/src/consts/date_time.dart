import 'package:intl/intl.dart';

extension OnDateTime on DateTime {
  String get time12Only => DateFormat('hh:mm a').format(this);
  String get ago => DateFormat('hh:mm a').format(this);
  String get time24Only => DateFormat('HH:MM').format(this);
  String get currentHour => DateFormat('hh').format(this);
  String get dateOnly => DateFormat('yyyy-MM-dd').format(this);
  String get timeAndDate => DateFormat('yyyy-MM-dd hh:mm a').format(this);
  String get current => DateFormat('yyyy-MM-dd hh:mm s').format(this);
  String get monthAndDay => DateFormat('dd MMM').format(this);
  String get yearMonthDay => DateFormat('dd MMM yyyy').format(this);
  String get birthDateForm => DateFormat('dd/MM/yyyy').format(this);
  String get nameOfDayAndMonth => DateFormat('EEEE, MMM dd').format(this);
  String get nameOfMonthAndTime => DateFormat('MMM dd hh:mm a').format(this);
  int get timeStamp => millisecondsSinceEpoch;
  int get timeStampForHours =>
      DateTime(year, 0, 0, hour, minute, second).millisecondsSinceEpoch;
}
