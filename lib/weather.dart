import 'package:flutter/material.dart';

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  String city = "";
  String temperature = "25°C";
  String humidity = "70%";
  String rainfall = "20%";
  String air = "Moderate";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Enter a city",
              ),
              onChanged: (value) {
                setState(() {
                  city = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              city.isEmpty
                  ? "Enter a city to get weather information"
                  : "$city Weather",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Temperature: $temperature",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              "Humidity: $humidity",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              "Rainfall: $rainfall",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              "Air: $air",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
