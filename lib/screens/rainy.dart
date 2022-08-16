import 'package:flutter/material.dart';
import 'package:ultra_weather/widgets/art/rainy.dart';
import 'package:ultra_weather/widgets/weather_screen_model.dart';
import 'package:ultra_weather/resources/colors.dart';
import 'package:ultra_weather/resources/strings.dart';
import 'package:ultra_weather/widgets/art/sunny.dart';

class RainyPage extends StatefulWidget {
  const RainyPage({Key? key}) : super(key: key);

  @override
  _RainyPageState createState() => _RainyPageState();
}

class _RainyPageState extends State<RainyPage> {
  @override
  Widget build(BuildContext context) {
    return const WeatherScreenModel(
        3,
        AppStrings.newYork,
        CustomColors.rainBlue,
        AppStrings.rainy,
        Rain(),
        AppStrings.newYorkTemp,
        AppStrings.newYorkHumidity,
        AppStrings.newYorkWindSpeed);
  }
}
