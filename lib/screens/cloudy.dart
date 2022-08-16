import 'package:flutter/material.dart';
import 'package:ultra_weather/widgets/weather_screen_model.dart';
import 'package:ultra_weather/resources/colors.dart';
import 'package:ultra_weather/resources/strings.dart';

import '../widgets/art/cloudy.dart';

class CloudyPage extends StatefulWidget {
  const CloudyPage({Key? key}) : super(key: key);

  @override
  _CloudyPageState createState() => _CloudyPageState();
}

class _CloudyPageState extends State<CloudyPage> {
  @override
  Widget build(BuildContext context) {
    return const WeatherScreenModel(
        2,
        AppStrings.provo,
        CustomColors.cloudGreen,
        AppStrings.cloudy,
        Clouds(),
        AppStrings.provoTemp,
        AppStrings.provoHumidity,
        AppStrings.provoWindSpeed);
  }
}
