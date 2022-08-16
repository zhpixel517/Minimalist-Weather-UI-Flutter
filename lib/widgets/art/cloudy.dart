import 'package:flutter/material.dart';

// cloudy art

import '../../resources/colors.dart';

class Clouds extends StatelessWidget {
  const Clouds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomCloudPainter(),
    );
  }
}

class CustomCloudPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center = size / 2;
    var paint = Paint()..color = CustomColors.cloudPink;
    var shadowPaint = Paint()..color = CustomColors.backgroundYellow;

    canvas.drawCircle(
        Offset(center.width - 76.5, center.height - 99), 85.0, shadowPaint);
    canvas.drawCircle(
        Offset(center.width + 44, center.height - 53), 85.0, shadowPaint);
    canvas.drawCircle(
        Offset(center.width + 157, center.height + 29), 88.0, shadowPaint);
    canvas.drawCircle(
        Offset(center.width - 75, center.height - 100), 85.0, paint);
    canvas.drawCircle(
        Offset(center.width + 30, center.height - 130), 85.0, paint);
    canvas.drawCircle(
        Offset(center.width + 45, center.height - 55), 85.0, paint);
    canvas.drawCircle(
        Offset(center.width + 125, center.height - 55), 85.0, paint);
    canvas.drawCircle(
        Offset(center.width + 160, center.height + 25), 90.0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
