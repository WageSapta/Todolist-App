import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared_components/text_custom.dart';

class Helpers {
  static snackbar(String text) => Get.rawSnackbar(
        messageText: Center(
          child: TextCustom(
            text: text,
            color: Colors.white,
          ),
        ),
        maxWidth: double.infinity,
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        snackPosition: SnackPosition.TOP,
        borderRadius: 15,
        animationDuration: const Duration(milliseconds: 100),
      );
}
