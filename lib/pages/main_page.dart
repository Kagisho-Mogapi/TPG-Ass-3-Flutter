import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kk_mogapi_219001867/models/weather_data.dart';
import 'package:kk_mogapi_219001867/widgets/app_label.dart';
import 'package:kk_mogapi_219001867/widgets/current_day.dart';
import 'package:kk_mogapi_219001867/widgets/topbanner.dart';
import 'package:kk_mogapi_219001867/widgets/weathercard.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<WeatherData>().fetchData;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<WeatherData>().fetchData;
        },
        child: Center(
          child: Consumer<WeatherData>(
            builder: (context, value, child) {
              return value.map.length == 0 && !value.error
                  ? Column(
                      children: [
                        const TopBanner(),
                        const AppLabel(),
                        CircularProgressIndicator(),
                      ],
                    )
                  : value.error
                      ? Text(
                          value.errorMsg,
                          textAlign: TextAlign.center,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const TopBanner(),
                            HeaderWidget(data: value),
                            SizedBox(
                              height: 10,
                            ),
                            const AppLabel(),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: 7,
                                itemBuilder: (context, index) {
                                  return WeatherDays(
                                      map: value.map['Cape Town'][index]);
                                },
                              ),
                            ),
                          ],
                        );
            },
          ),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  final WeatherData data;

  @override
  Widget build(BuildContext context) {
    return CurrentDayWidget(
      conditionImg: headerConditionImg(data.map['Cape Town']),
      currTemp: headerTemp(data.map['Cape Town']),
      conditionTxt: headerConditionTxt(data.map['Cape Town']),
      todayTemps: headerTodayTemps(data.map['Cape Town']),
      windSpeed: windSpeed(data.map['Cape Town']),
    );
  }
}

class WeatherDays extends StatelessWidget {
  const WeatherDays({required this.map});
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return WeatherCard(
      dayName: dayName(map['day']),
      humidity: "${map['humidity']}",
      minMaxTemp: "${map['maxtemp']}\u00b0/ ${map['mintemp']}\u00b0",
      dayCondition: dayCondition(map['condition_day']),
      nightCondition: nightCondition(map['condition_night']),
      currDayColor: currDayColor(map['day']),
    );
  }
}

String dayName(data) {
  final String currDay = DateFormat("EEEE").format(DateTime.now());

  if (currDay == data) {
    return 'Today';
  } else {
    return data;
  }
}

Color currDayColor(day) {
  final String currDay = DateFormat("EEEE").format(DateTime.now());

  if (currDay == day) {
    return Colors.blue.shade100;
  } else {
    return Colors.white;
  }
}

String dayCondition(data) {
  if (data == "Cloudy") {
    return 'assets/images/cloudy_day.png';
  } else if (data == "Fair") {
    return 'assets/images/fair_day.png';
  } else {
    return 'assets/images/rain.png';
  }
}

String nightCondition(data) {
  if (data == "Cloudy") {
    return 'assets/images/cloudy_night.png';
  } else if (data == "Fair") {
    return 'assets/images/fair_night.png';
  } else {
    return 'assets/images/rain.png';
  }
}

String headerConditionImg(data) {
  String location = '';
  final int currHour = int.parse(DateFormat("H").format(DateTime.now()));
  final String currDay = DateFormat("EEEE").format(DateTime.now());

  for (Map<String, dynamic> values in data) {
    if (currDay == values['day']) {
      if (currHour < 6 || currHour >= 18) {
        if (values['condition_night'] == "Cloudy") {
          location = 'assets/images/cloudy_night.png';
        } else if (values['condition_night'] == "Fair") {
          location = 'assets/images/fair_night.png';
        } else {
          location = 'assets/images/rain.png';
        }
      } else {
        if (values['condition_day'] == "Cloudy") {
          location = 'assets/images/cloudy_day.png';
        } else if (values['condition_day'] == "Fair") {
          location = 'assets/images/fair_day.png';
        } else {
          location = 'assets/images/rain.png';
        }
      }
    }
  }
  return location;
}

String headerTemp(data) {
  String temp = '';
  final int currHour = int.parse(DateFormat("H").format(DateTime.now()));
  final String currDay = DateFormat("EEEE").format(DateTime.now());

  for (Map<String, dynamic> values in data) {
    if (currDay == values['day']) {
      if (currHour < 6 || currHour >= 18) {
        temp = values['mintemp'];
      } else {
        temp = values['maxtemp'];
      }
    }
  }
  return temp + '\u00b0';
}

String headerConditionTxt(data) {
  String condition = '';
  final int currHour = int.parse(DateFormat("H").format(DateTime.now()));
  final String currDay = DateFormat("EEEE").format(DateTime.now());

  for (Map<String, dynamic> values in data) {
    if (currDay == values['day']) {
      if (currHour < 6 || currHour >= 18) {
        condition = values['condition_night'];
      } else {
        condition = values['condition_day'];
      }
    }
  }
  return condition;
}

String headerTodayTemps(data) {
  String temps = '';
  final String currDay = DateFormat("EEEE").format(DateTime.now());

  for (Map<String, dynamic> values in data) {
    if (currDay == values['day']) {
      temps = '${values['maxtemp']}\u00b0/ ${values['mintemp']}\u00b0';
    }
  }
  return temps;
}

String windSpeed(data) {
  String speed = '';
  final String currDay = DateFormat("EEEE").format(DateTime.now());
  print(currDay);

  for (Map<String, dynamic> values in data) {
    if (currDay == values['day']) {
      speed = values['wind'];
    }
  }
  return speed + 'kph wind';
}
