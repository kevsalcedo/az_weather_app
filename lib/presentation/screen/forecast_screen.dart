import 'package:flutter/material.dart';

import 'package:az_weather_app/services/weather_model.dart';
import 'package:az_weather_app/config/utilities/constants.dart';
import 'package:az_weather_app/presentation/widgets/weather_info.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({super.key});

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  WeatherModel weatherModel = WeatherModel();

  late String city = '';

  late String description1 = '';
  late String description2 = '';
  late String description3 = '';

  late String weatherIcon1 = '';
  late String weatherIcon2 = '';
  late String weatherIcon3 = '';

  late int maxTemp1 = 0;
  late int maxTemp2 = 0;
  late int maxTemp3 = 0;

  late int minTemp1 = 0;
  late int minTemp2 = 0;
  late int minTemp3 = 0;

  late int humidity1 = 0;
  late int humidity2 = 0;
  late int humidity3 = 0;

  @override
  void initState() {
    super.initState();
    getForecastData();
  }

  void getForecastData() async {
    var weatherData = await weatherModel.getForecastWeather();
    updateUI(weatherData);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        city = '';

        description1 = 'Unable to get weather data';
        description2 = 'Unable to get weather data';
        description3 = 'Unable to get weather data';

        weatherIcon1 = 'error';
        weatherIcon2 = 'error';
        weatherIcon3 = 'error';

        maxTemp1 = 0;
        minTemp1 = 0;
        humidity1 = 0;

        maxTemp2 = 0;
        minTemp2 = 0;
        humidity2 = 0;

        maxTemp3 = 0;
        minTemp3 = 0;
        humidity3 = 0;
        return;
      }

      city = weatherData['city']['name'];

      double maxT1 = weatherData['list'][8]['main']['temp_max'];
      maxTemp1 = maxT1.toInt();
      double minT1 = weatherData['list'][8]['main']['temp_min'];
      minTemp1 = minT1.toInt();
      humidity1 = weatherData['list'][8]['main']['humidity'];
      int id1 = weatherData['list'][8]['weather'][0]['id'];
      weatherIcon1 = weatherModel.getWeatherIcon(id1);
      description1 = weatherData['list'][8]['weather'][0]['description'];

      double maxT2 = weatherData['list'][16]['main']['temp_max'];
      maxTemp2 = maxT2.toInt();
      double minT2 = weatherData['list'][16]['main']['temp_min'];
      minTemp2 = minT2.toInt();
      humidity2 = weatherData['list'][16]['main']['humidity'];
      int id2 = weatherData['list'][16]['weather'][0]['id'];
      weatherIcon2 = weatherModel.getWeatherIcon(id2);
      description2 = weatherData['list'][16]['weather'][0]['description'];

      double maxT3 = weatherData['list'][24]['main']['temp_max'];
      maxTemp3 = maxT3.toInt();
      double minT3 = weatherData['list'][24]['main']['temp_min'];
      minTemp3 = minT3.toInt();
      humidity3 = weatherData['list'][24]['main']['humidity'];
      int id3 = weatherData['list'][24]['weather'][0]['id'];
      weatherIcon3 = weatherModel.getWeatherIcon(id3);
      description3 = weatherData['list'][24]['weather'][0]['description'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBackgroundDecoration,
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          'Pronostico en $city',
                          style: kTopTitle,
                        ),
                        const SizedBox(width: 3),
                        const Text(
                          'To AZ Smart',
                          style: kAZTitle,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      DailyInfo(
                        day: 'Mañana',
                        description: description1,
                        weatherIcon: weatherIcon1,
                        maxTemp: maxTemp1,
                        minTemp: minTemp1,
                        humidity: humidity1,
                      ),
                      DailyInfo(
                        day: 'Pasado mañana',
                        description: description2,
                        weatherIcon: weatherIcon2,
                        maxTemp: maxTemp2,
                        minTemp: minTemp2,
                        humidity: humidity2,
                      ),
                      DailyInfo(
                        day: 'En dos días',
                        description: description3,
                        weatherIcon: weatherIcon3,
                        maxTemp: maxTemp3,
                        minTemp: minTemp3,
                        humidity: humidity3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DailyInfo extends StatelessWidget {
  const DailyInfo({
    super.key,
    required this.day,
    required this.description,
    required this.weatherIcon,
    required this.maxTemp,
    required this.minTemp,
    required this.humidity,
  });

  final String day;
  final String description;
  final String weatherIcon;
  final int maxTemp;
  final int minTemp;
  final int humidity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$day, $description $weatherIcon',
          style: kDaily,
        ),
        const SizedBox(height: 5),
        WeatherInfo(
          maxTemp: maxTemp,
          minTemp: minTemp,
          humidity: humidity,
        ),
        const SizedBox(height: 35),
      ],
    );
  }
}
