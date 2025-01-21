import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String dateFormatter = 'MMMM dd, y';

extension DateHelper on DateTime 
{
  String formatDate() {
    final formatter = DateFormat(dateFormatter);
    return formatter.format(this);
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  int getDifferenceInDaysWithNow() {
    final now = DateTime.now();
    return now.difference(this).inDays;
  }
}

extension TimeOfDayExt on TimeOfDay {
  /// note: 'hour' is in 24-hour format
  double toDouble() => hour + minute / 60.0;
}
