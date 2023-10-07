import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/shared_components/text_custom.dart';

import '../config/colors/app_colors.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({super.key, this.onPressed, required this.text});

  final Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[900],
        foregroundColor: AppColors.white,
        fixedSize: Size(Get.width, 53),
      ),
      child: TextCustom(
        text: text,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
