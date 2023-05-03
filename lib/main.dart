import 'package:flutter/material.dart';
import 'package:weather_app/realdata.dart';
import 'package:weather_app/ui.dart';
import 'package:weather_app/uiii.dart';
import 'package:weather_app/weather.dart';

import 'api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      title: "weathero",
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WeatherAppp(),
    );
  }
}
