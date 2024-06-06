import 'package:flutter/material.dart';

class DiagonalBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF276749)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..lineTo(0, size.height * 0.3)
      ..lineTo(size.width, size.height * 0.7)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
