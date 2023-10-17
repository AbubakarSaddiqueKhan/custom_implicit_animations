import 'dart:math';

import 'package:flutter/material.dart';

class SpinWheelDesignPainter extends CustomPainter {
  final totalNumberOfOptions;
  final List<String> listOfPrices;

  const SpinWheelDesignPainter(
      {required this.totalNumberOfOptions, required this.listOfPrices});
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final radius = min(width, height) / 2;
    final centerOffset = Offset(width / 2, height / 2);
    final TOTAL_NUMBER_OF_TICKS = 2 * pi / totalNumberOfOptions;
    Paint outerBorderPaint = Paint()
      ..color = Colors.brown
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(centerOffset, radius, outerBorderPaint);
    Random random = Random();

    Paint innerOptionsPaint = Paint()
      ..color = Color.fromARGB(random.nextInt(0xFF), random.nextInt(0xFF),
          random.nextInt(0xFF), random.nextInt(0xFF));

    canvas.save();
    canvas.translate(centerOffset.dx, centerOffset.dy);

    for (var i = 0; i < totalNumberOfOptions; i++) {
      canvas.drawLine(Offset(0, 0), Offset(0, -radius), outerBorderPaint);

      final textStyle = TextStyle(
          color: Colors.brown,
          fontSize: 25,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold);
      final textSpan = TextSpan(
        text: listOfPrices[i].toString(),
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: size.width,
      );
      final offset = Offset(radius * 0.3, -radius * 0.6);
      textPainter.paint(canvas, offset);
      // canvas.drawArc(Rect.fromLTWH(0, 0, width, height), degToRadian(0),
      //     degToRadian(20), true, innerOptionsPaint);
      canvas.rotate(TOTAL_NUMBER_OF_TICKS);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(SpinWheelDesignPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(SpinWheelDesignPainter oldDelegate) => true;
}

double degToRadian(double degree) {
  return pi / 180 * degree;
}
