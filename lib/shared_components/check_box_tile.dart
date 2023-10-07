import 'package:flutter/material.dart';

class CheckBoxTile extends StatelessWidget {
  const CheckBoxTile({
    Key? key,
    this.onChanged,
    this.valueKey,
    this.value,
    this.title,
    this.subtitle,
    this.controlAffinity,
    this.tileColor,
    this.contentPadding,
  }) : super(key: key);

  final Function(bool?)? onChanged;
  final Key? valueKey;
  final bool? value;
  final Widget? title;
  final Widget? subtitle;
  final ListTileControlAffinity? controlAffinity;
  final Color? tileColor;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      key: valueKey,
      value: value,
      onChanged: onChanged,
      tileColor: tileColor ?? Colors.white,
      contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 16),
      controlAffinity: controlAffinity ?? ListTileControlAffinity.leading,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      checkboxShape: const CircleBorder(),
      title: title,
      subtitle: subtitle,
    );
  }
}
