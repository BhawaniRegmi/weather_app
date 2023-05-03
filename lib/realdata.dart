import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherData {
  final String city;
  final String temperature;
  final String humidity;
  final String rainfall;
  final String air;

  WeatherData({
    required this.city,
    required this.temperature,
    required this.humidity,
    required this.rainfall,
    required this.air,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      city: json['name'],
      temperature: '${json['main']['temp']}°C',
      humidity: '${json['main']['humidity']}%',
      rainfall: '${json['rain'] != null ? json['rain']['1h'] : '0'}%',
      air: json['weather'][0]['description'],
    );
  }
}

class WeatherAppp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherAppp>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  WeatherData? _weatherData;

  final _cityController = TextEditingController();

  Future<void> _fetchWeatherData(String cityName) async {
    final apiKey = '63851b9089da17031b30e8b7d364ebd7';
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _weatherData = WeatherData.fromJson(data);
      });
    } else {
      setState(() {
        _weatherData = null;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _animation,
                child: Icon(
                  Icons.cloud,
                  size: 100,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 32),
              TextField(
                controller: _cityController,
                decoration: InputDecoration(
                  hintText: 'Enter a city',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _fetchWeatherData(_cityController.text);
                },
                child: Text('Get Weather'),
              ),
              SizedBox(height: 32),
              if (_weatherData != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '${_weatherData!.city} Weather',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Temperature: ${_weatherData!.temperature}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Humidity: ${_weatherData!.humidity}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Rainfall: ${_weatherData!.rainfall}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Air: ${_weatherData!.air}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              if (_weatherData == null)
                Text(
                  'Error fetching weather data.',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
