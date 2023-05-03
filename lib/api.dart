import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherAppo extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherAppo> {
  String city = "";
  String temperature = "";
  String humidity = "";
  String rainfall = "";
  String air = "";

  Future<void> fetchWeatherData(String cityName) async {
    final apiKey = "63851b9089da17031b30e8b7d364ebd7";
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        city = data['name'];
        temperature = "${data['main']['temp']}°C";
        humidity = "${data['main']['humidity']}%";
        rainfall = "${data['rain'] != null ? data['rain']['1h'] : '0'}%";
        air = data['weather'][0]['description'];
      });
    } else {
      setState(() {
        city = "Error fetching data";
        temperature = "";
        humidity = "";
        rainfall = "";
        air = "";
      });
    }
  }

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
              onSubmitted: (value) {
                fetchWeatherData(value);
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
