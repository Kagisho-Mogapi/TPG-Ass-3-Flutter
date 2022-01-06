import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard(
      {required this.dayName,
      required this.humidity,
      required this.minMaxTemp,
      required this.dayCondition,
      required this.nightCondition,
      required this.currDayColor});
  final String dayName;
  final String humidity;
  final String minMaxTemp;
  final String dayCondition;
  final String nightCondition;
  final Color currDayColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
        child: Card(
          color: currDayColor,
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dayName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/humidity.png',
                      height: 20,
                      width: 20,
                    ),
                    Text(
                      humidity,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      dayCondition,
                      height: 25,
                      width: 25,
                    ),
                    Image.asset(
                      nightCondition,
                      height: 25,
                      width: 25,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      minMaxTemp,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
