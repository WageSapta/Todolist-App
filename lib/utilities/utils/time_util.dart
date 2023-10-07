import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeUtil {
  static String toJM(DateTime date) {
    final formatTime = DateFormat.jm();
    return formatTime.format(date);
  }

  static DateTime toDate(DateTime date, TimeOfDay time) {
    var result =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    return result;
  }
}
