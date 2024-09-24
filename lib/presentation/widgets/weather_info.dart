import 'package:flutter/material.dart';

import 'package:az_weather_app/presentation/widgets/custom_card.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    super.key,
    required this.maxTemp,
    required this.minTemp,
    required this.humidity,
  });

  final int maxTemp;
  final int minTemp;
  final int humidity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCard(
          cardName: 'Max temp.',
          cardValue: maxTemp,
        ),
        CustomCard(
          cardName: 'Min temp.',
          cardValue: minTemp,
        ),
        CustomCard(
          icon: Icons.water_drop,
          cardName: 'Humedad',
          cardValue: humidity,
          sign: '%',
        ),
      ],
    );
  }
}
