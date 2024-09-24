import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.icon = Icons.thermostat,
    required this.cardName,
    required this.cardValue,
    this.sign = '°',
  });

  final IconData icon;
  final String cardName;
  final String sign;
  final int? cardValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 12, top: 5, bottom: 5),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 60,
            color: Colors.white.withOpacity(0.9),
          ),
          Column(
            children: [
              Text(
                cardName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              cardValue == 0
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      '$cardValue$sign',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
