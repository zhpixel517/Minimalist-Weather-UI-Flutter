import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ultra_weather/resources/colors.dart';
import '../resources/fonts.dart';
import '../resources/strings.dart';
import 'package:sensors_plus/sensors_plus.dart';

class WeatherScreenModel extends StatefulWidget {
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
  State<WeatherScreenModel> createState() => _WeatherScreenModelState();
}

class _WeatherScreenModelState extends State<WeatherScreenModel> {
  late AccelerometerEvent acceleration;
  StreamSubscription<AccelerometerEvent>? _streamSubscription;
  int motionSensitivity = 4;

  @override
  void initState() {
    acceleration = AccelerometerEvent(0, 0, 0);
    _streamSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        acceleration = event;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.bgColor,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            top: acceleration.y * motionSensitivity,
            bottom: acceleration.y * -motionSensitivity,
            right: acceleration.x * -motionSensitivity,
            left: acceleration.x * motionSensitivity,
            child: Container(
              color: widget.bgColor,
              child: Center(child: widget.art),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            top: acceleration.y * -motionSensitivity,
            bottom: acceleration.y * motionSensitivity,
            right: acceleration.x * motionSensitivity,
            left: acceleration.x * -motionSensitivity,
            child: SafeArea(
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
                                Text(AppStrings.date,
                                    style: Fonts.titleTextTheme),
                                Text(widget.cityName,
                                    style: Fonts.titleTextTheme)
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: Text(widget.condition,
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
                              widget.temperature,
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
                                  "Humidity: ${widget.humidity}",
                                  style: Fonts.detailedWeatherInfoStyle,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  "Wind Speed: ${widget.windSpeed}",
                                  style: Fonts.detailedWeatherInfoStyle,
                                ),
                              ),
                              Center(
                                  child: DotsIndicator(
                                dotsCount: 3,
                                position: double.tryParse(
                                    (widget.pagePosition - 1).toString())!,
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
          ),
        ],
      ),
    );
  }
}
