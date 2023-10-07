import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateUtil {
  static final DateFormat _monthFormat = DateFormat("MMM yy");
  static final DateFormat _dayFormat = DateFormat("EEEE");
  static final DateFormat _fullFormat = DateFormat("EEEE d, MMM");
  static final DateFormat _fullNumberFormat = DateFormat("d/MM/yy");

  static String monthYear(DateTime d) => _monthFormat.format(d);
  static String day(DateTime d) => _dayFormat.format(d).toUpperCase();
  static String full(DateTime d) => _fullFormat.format(d);
  static String fullNumber(DateTime d) => _fullNumberFormat.format(d);

  static timeAsync(TimeOfDay time, DateTime date) {
    var result = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    return result;
  }
}
