import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ultra_weather/resources/colors.dart';
import '../resources/fonts.dart';
import '../resources/strings.dart';

class WeatherScreenModel extends StatelessWidget {
  final String condition;
  final Color bgColor;
  final String cityName;
  final Widget art;
  final String temperature;
  final String humidity;
  final String windSpeed;
  final int pagePosition;
  const WeatherScreenModel(this.pagePosition, this.cityName, this.bgColor,
      this.condition, this.art, this.temperature, this.humidity, this.windSpeed,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: bgColor,
          child: Center(child: art),
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0, left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppStrings.date, style: Fonts.titleTextTheme),
                            Text(cityName, style: Fonts.titleTextTheme)
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: Text(condition,
                                style: Fonts.titleTextTheme
                                    .copyWith(fontSize: 40.0)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15.0, bottom: 15.0),
                        child: Text(
                          temperature,
                          style: Fonts.largeConditionStyle,
                        ),
                      ),
                    )),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Humidity: $humidity",
                              style: Fonts.detailedWeatherInfoStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Wind Speed: $windSpeed",
                              style: Fonts.detailedWeatherInfoStyle,
                            ),
                          ),
                          Center(
                              child: DotsIndicator(
                            dotsCount: 3,
                            position:
                                double.tryParse((pagePosition - 1).toString())!,
                            decorator: const DotsDecorator(activeColors: [
                              CustomColors.sunOrange,
                              CustomColors.cloudPink,
                              CustomColors.raindropBlue
                            ]),
                          ))
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
