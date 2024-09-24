import 'package:az_weather_app/config/utilities/constants.dart';
import 'package:az_weather_app/presentation/screen/forecast_screen.dart';
import 'package:az_weather_app/presentation/widgets/weather_info.dart';
import 'package:az_weather_app/services/weather_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.locationWeather});

  final locationWeather;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel weatherModel = WeatherModel();

  late int temperature;
  late String cityName;
  late int maxTemp;
  late int minTemp;
  late int humidity;
  late String weatherIcon;
  late String weatherMessage;
  late String weatherDescription;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        cityName = '';
        maxTemp = 30;
        minTemp = -10;
        weatherIcon = 'error';
        weatherMessage = 'unable to get weather data.';
        weatherDescription = 'error';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();

      double maxT = weatherData['main']['temp_max'];
      maxTemp = maxT.toInt();

      double minT = weatherData['main']['temp_min'];
      minTemp = minT.toInt();

      humidity = weatherData['main']['humidity'];

      weatherMessage = weatherModel.getMessage(temperature);

      cityName = weatherData['name'];

      int id = weatherData['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CustomFABButton(),
      body: Container(
        decoration: kBackgroundDecoration,
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Clima en $cityName',
                          style: kTopTitle,
                        ),
                        const SizedBox(width: 3),
                        const Text(
                          'To AZ Smart',
                          style: kAZTitle,
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      setState(() {
                        updateUI(weatherData);
                      });
                    },
                    child: const Icon(
                      Icons.refresh,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '$temperature°',
                          style: kTempTextStyle,
                        ),
                        Text(
                          weatherIcon,
                          style: kConditionTextStyle,
                        ),
                      ],
                    ),
                    Text(
                      weatherMessage,
                      textAlign: TextAlign.center,
                      style: kMessageTextStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: WeatherInfo(
                  maxTemp: maxTemp,
                  minTemp: minTemp,
                  humidity: humidity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomFABButton extends StatelessWidget {
  const CustomFABButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ForecastScreen()),
        );
      },
      style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.black)),
      child: const Text(
        'Conocer pronostico',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

