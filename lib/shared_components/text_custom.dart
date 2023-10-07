import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  const TextCustom({
    Key? key,
    this.fontWeight = FontWeight.normal,
    this.overflow = TextOverflow.ellipsis,
    this.fontSize = 14,
    this.color,
    this.maxLines = 1,
    this.textAlign,
    this.textDecoration,
    required this.text,
  }) : super(key: key);

  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        overflow: overflow,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        decoration: textDecoration,
        decorationThickness: 2,
      ),
    );
  }
}
