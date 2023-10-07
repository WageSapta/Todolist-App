
import 'package:flutter/material.dart';

class AddFormField extends StatelessWidget {
  const AddFormField({
    super.key,
    required this.controller,
    this.maxLines = 5,
    required this.hint,
  });

  final TextEditingController controller;
  final int maxLines;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: controller,
      maxLines: maxLines,
      minLines: 1,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.black.withOpacity(.5)),
      ),
      validator: (e) {
        if (e == null || e.isEmpty) {
          return "Can't be empty";
        }
        return null;
      },
    );
  }
}
