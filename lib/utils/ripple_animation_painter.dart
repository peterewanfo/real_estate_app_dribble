import 'package:flutter/material.dart';

class AnimationPainter extends CustomPainter{

  final double firstRippleRadius;
  final double firstRippleOpacity;
  final double firstRippleStrokeWidth;

  final double centerCircleRadius;
  final double transparentCenterCircleRadius;

  AnimationPainter(
    this.firstRippleRadius,
    this.firstRippleOpacity,
    this.firstRippleStrokeWidth,
    this.centerCircleRadius,
    this.transparentCenterCircleRadius,
  );

  @override
  void paint(Canvas canvas, Size size) {
    Color color1 = const Color(0xFFFFFFFF);

    Paint firstPaint = Paint();
    firstPaint.color = color1.withOpacity(firstRippleOpacity);
    firstPaint.style = PaintingStyle.stroke;
    firstPaint.strokeWidth = firstRippleStrokeWidth;

    final center = Offset(size.width / 2, size.height / 2); 

    canvas.drawCircle(center, firstRippleRadius, firstPaint);

    Paint thirdPaint = Paint();
    thirdPaint.color = color1;
    thirdPaint.style = PaintingStyle.fill;

    canvas.drawCircle(center, centerCircleRadius, thirdPaint);

    Paint transparentPaint = Paint();
    thirdPaint.color = Colors.transparent;
    thirdPaint.style = PaintingStyle.fill;

    canvas.drawCircle(center, transparentCenterCircleRadius, transparentPaint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}