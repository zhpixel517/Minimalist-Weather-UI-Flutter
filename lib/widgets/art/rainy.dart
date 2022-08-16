import 'package:flutter/material.dart';

import '../../resources/colors.dart';

class Rain extends StatelessWidget {
  const Rain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomRainPainter(),
    );
  }
}

class CustomRainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center = size / 2;
    var paint = Paint()..color = CustomColors.raindropBlue;
    var shadowPaint = Paint()..color = CustomColors.backgroundYellow;

    // bottom left rain drop
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(center.width - 75, center.height + 75),
            width: 75,
            height: 75),
        paint);
    canvas.drawCircle(
        Offset(center.width - (150 + 79) / 2, center.height + (150 + 77) / 2),
        76,
        shadowPaint);
    canvas.drawCircle(
        Offset(center.width - (150 + 75) / 2, center.height + (150 + 75) / 2),
        75,
        paint);

    // top right rain drop
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(center.width + 150, center.height - 250),
            width: 75,
            height: 75),
        paint);
    canvas.drawCircle(
        Offset(center.width + (300 - 79) / 2, center.height - (500 - 77) / 2),
        76,
        shadowPaint);
    canvas.drawCircle(
        Offset(center.width + (300 - 75) / 2, center.height - (500 - 75) / 2),
        75,
        paint);

    // left rain drop
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(center.width - 50, center.height - 150),
            width: 75,
            height: 75),
        paint);
    canvas.drawCircle(
        Offset(center.width - (100 + 78) / 2, center.height - (200 + 22) / 2),
        76,
        shadowPaint);
    canvas.drawCircle(
        Offset(center.width - (100 + 75) / 2, center.height - (200 + 25) / 2),
        75,
        paint);

    // right rain drop
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(center.width + 125, center.height - 25),
            width: 75,
            height: 75),
        paint);

    canvas.drawCircle(
        Offset(center.width + (100 + 73) / 2, center.height + 28 / 2),
        76,
        shadowPaint);

    canvas.drawCircle(
        Offset(center.width + (100 + 75) / 2, center.height + 25 / 2),
        75,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
