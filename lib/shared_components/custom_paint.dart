import 'package:flutter/material.dart';

class CustomPaint extends CustomPainter {
  final int colorValue;

  CustomPaint({super.repaint, required this.colorValue});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Color(colorValue); // Background color
    final path = Path();

    // Define the curve points
    final startPoint = Offset(0, 0);
    final controlPoint1 = Offset(size.width * 0.3, size.height * 0.5);
    final controlPoint2 = Offset(size.width * 0.7, size.height * 0.5);
    final endPoint = Offset(size.width, 0);

    // Move to the starting point
    path.moveTo(startPoint.dx, startPoint.dy);

    // Draw the curved path
    path.cubicTo(
      controlPoint1.dx,
      controlPoint1.dy,
      controlPoint2.dx,
      controlPoint2.dy,
      endPoint.dx,
      endPoint.dy,
    );

    // Draw the path to the bottom-right corner
    path.lineTo(size.width, size.height);

    // Draw the path to the bottom-left corner
    path.lineTo(0, size.height);

    // Close the path to complete the shape
    path.close();

    // Fill the path with the defined color
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
