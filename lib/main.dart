import 'package:flutter/material.dart';
import 'package:kk_mogapi_219001867/models/weather_data.dart';
import 'package:kk_mogapi_219001867/pages/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => WeatherData(),
        builder: (context, child) {
          return MainPage();
        },
      ),
    );
  }
}
