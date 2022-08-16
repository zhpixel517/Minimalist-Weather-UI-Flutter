import 'package:flutter/material.dart';
import 'package:ultra_weather/widgets/weather_screen_model.dart';
import 'package:ultra_weather/resources/colors.dart';
import 'package:ultra_weather/resources/strings.dart';
import 'package:ultra_weather/widgets/art/sunny.dart';

class SunnyPage extends StatelessWidget {
  const SunnyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WeatherScreenModel(
        1,
        AppStrings.franklin,
        CustomColors.sunPink,
        AppStrings.sunny,
        Sun(),
        AppStrings.franklinTemp,
        AppStrings.franklinHumidity,
        AppStrings.franklinWindSpeed);
  }
}
