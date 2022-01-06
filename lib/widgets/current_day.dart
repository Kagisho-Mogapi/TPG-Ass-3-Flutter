import 'package:flutter/material.dart';

class CurrentDayWidget extends StatelessWidget {
  CurrentDayWidget({
    Key? key,
    required this.conditionImg,
    required this.currTemp,
    required this.conditionTxt,
    required this.todayTemps,
    required this.windSpeed,
  }) : super(key: key);

  final String conditionImg;
  final String currTemp;
  final String conditionTxt;
  final String todayTemps;
  final String windSpeed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 110,
                width: 110,
                child: Image.asset(conditionImg),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                currTemp,
                style: TextStyle(fontSize: 70),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                conditionTxt,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                todayTemps,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                windSpeed
                /*'12kph wind'*/,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
