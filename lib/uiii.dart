import 'package:flutter/material.dart';

class WeatherAppUI extends StatefulWidget {
  @override
  _WeatherAppUIState createState() => _WeatherAppUIState();
}

class _WeatherAppUIState extends State<WeatherAppUI> {
  String cityName = "New York";
  String temperature = "25°C";
  String weatherType = "Cloudy";
  String humidity = "60%";
  String windSpeed = "20km/h";
  String sunrise = "6:00 AM";
  String sunset = "8:00 PM";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Enter city name:",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          TextField(
            onChanged: (value) {
              cityName = value;
            },
            decoration: InputDecoration(
              hintText: "City name",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$temperature",
                style: TextStyle(fontSize: 48),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$cityName",
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    "$weatherType",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(Icons.opacity),
                  SizedBox(height: 10),
                  Text("$humidity"),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.toys),
                  SizedBox(height: 10),
                  Text("$windSpeed"),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.wb_sunny),
                  SizedBox(height: 10),
                  Text("$sunrise"),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.nights_stay),
                  SizedBox(height: 10),
                  Text("$sunset"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
