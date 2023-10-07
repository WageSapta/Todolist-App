import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';

class AppColors {
  static const Color teal = Color.fromARGB(255, 100, 204, 197);
  static const Color white = Color.fromARGB(255, 238, 238, 238);
  static const Color red = Color.fromARGB(255, 215, 19, 19);
  static const Color yellow = Color.fromARGB(255, 240, 222, 54);
  static const Color blue = Color.fromARGB(255, 25, 167, 206);
  static const Color orange = Color.fromARGB(255, 255, 96, 0);
  static const Color crime = Color.fromARGB(255, 255, 245, 224);
  static const Color sage = Color.fromARGB(255, 176, 217, 177);
  static const Color purple = Color.fromARGB(255, 190, 173, 250);
  static const Color peach = Color.fromARGB(255, 255, 137, 137);

  static Color randomColor() {
    // Options options = Options(
    //   format: Format.rgba,
    //   luminosity: Luminosity.bright,
    // );
    // return color;
    // var color = RandomColor.getColor(options);
    List<Color> colors = [
      teal,
      red,
      yellow,
      blue,
      orange,
      crime,
      sage,
      purple,
      peach
    ];
    colors.sort((a, b) => a.toString()[0].compareTo(b.toString()[0]));
    return colors[Random().nextInt(colors.length)];
  }
}
