import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/shared_components/text_custom.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({
    super.key,
    this.title = "Are you sure?",
    required this.content,
    this.buttonText = "Delete",
    this.onPressed,
    this.buttonColor,
  });

  final String title;
  final String content;
  final String buttonText;
  final Color? buttonColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: TextCustom(
        text: title,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      content: TextCustom(
        text: content,
        maxLines: 5,
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.black.withOpacity(.1),
            foregroundColor: Colors.black,
          ),
          child: const Text('Cancel'),
          onPressed: () => Get.back(),
        ),
        TextButton(
          style: buttonColor == null
              ? null
              : TextButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: Colors.white,
                ),
          onPressed: onPressed,
          child: Text(buttonText),
        ),
      ],
    );
  }
}
