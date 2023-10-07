import 'package:flutter/widgets.dart';

// String
extension StringExtensions on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  String capitalizeFirstLetter() {
    if (isNullOrEmpty) return this!;
    return "${this![0].toUpperCase()}${this!.substring(1)}";
  }

  String twoLetter() {
    if (isNullOrEmpty) return this!;
    String result = "";
    List<String> words = this!.split(" ");
    for (var e in words) {
      String first = e.substring(0, 1);
      result = result + first.toUpperCase();
    }
    return result;
  }
}

// List
extension ListExtension on List {
  List<Widget> addLastHeight(double space, {bool isColumn = true}) {
    var result = List<Widget>.empty(growable: true);
    var h = SizedBox(height: space);
    var w = SizedBox(width: space);
    for (int i = 0; i < length; i++) {
      result.add(this[i]);
    }
    result.add(isColumn ? h : w);
    return result;
  }

  List<Widget> separated(double space, {bool isColumn = true}) {
    var result = List<Widget>.empty(growable: true);
    var h = SizedBox(height: space);
    var w = SizedBox(width: space);
    for (int i = 0; i < length; i++) {
      result.add(this[i]);
      if (i != length - 1) {
        result.add(isColumn ? h : w);
      }
    }
    return result;
  }

  List<Widget> separatedAll(
    double num, {
    bool isColumn = true,
  }) {
    var result = List<Widget>.empty(growable: true);
    var h = SizedBox(height: num);
    var w = SizedBox(width: num);
    for (int i = 0; i < length; i++) {
      result.add(isColumn ? h : w);
      result.add(this[i]);
      if (i == length - 1) {
        result.add(isColumn ? h : w);
      }
    }
    return result;
  }
}

// DateTime
extension DateHelpers on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.day == day &&
        tomorrow.month == month &&
        tomorrow.year == year;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }
}
