import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:az_weather_app/services/weather_model.dart';
import 'package:az_weather_app/config/utilities/constants.dart';
import 'package:az_weather_app/presentation/screen/home_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          locationWeather: weatherData,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBackgroundDecoration,
        constraints: const BoxConstraints.expand(),
        child: const Center(
          child: SpinKitSpinningLines(
            color: Colors.white,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
