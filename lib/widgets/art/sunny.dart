import 'package:flutter/material.dart';
import 'package:ultra_weather/resources/colors.dart';

class Sun extends StatelessWidget {
  const Sun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomSunPainter(),
    );
  }
}

class CustomSunPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center = size / 2;
    var paint = Paint()..color = CustomColors.sunOrange;
    var shadowPaint = Paint()..color = CustomColors.backgroundYellow;
    var whiteLinePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3.0;
    canvas.drawCircle(
        Offset(center.width - 3, center.height), 165.0, shadowPaint);
    canvas.drawCircle(Offset(center.width, center.height), 165.0, paint);
    canvas.drawLine(Offset(center.width + 195, center.height - 50),
        Offset(center.width + 15, center.height - 50), whiteLinePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
