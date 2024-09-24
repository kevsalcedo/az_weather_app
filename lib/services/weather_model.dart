import 'package:az_weather_app/services/location_services.dart';
import 'package:az_weather_app/services/network_helper.dart';

const apiKey = '8b03c1351fb69ba406dd5d8bd4050128';
const openWeather = 'https://api.openweathermap.org/data/2.5/';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    LocationServices location = LocationServices();

    await location.requestPermission();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
      '${openWeather}weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric',
    );

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'Clima perfecto para un 🍦!';
    } else if (temp > 20) {
      return 'Esta fresco! Usa una 👕, shorts y disfrutal el dia!';
    } else if (temp < 10) {
      return 'Que frio!🥶 Mejor te abrigas o te congelaras🧣🧤';
    } else {
      return 'Lleva un 🧥 por las dudas!';
    }
  }

  Future<dynamic> getForecastWeather() async {
    LocationServices location = LocationServices();

    await location.requestPermission();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
      '${openWeather}forecast?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric&lang=es',
    );

    var forecastData = await networkHelper.getData();
    return forecastData;
  }
}