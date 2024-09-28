import 'package:flutter/material.dart';
import 'weather_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherService _weatherService = WeatherService();
  Map<String, dynamic>? _weatherData; // Make nullable
  String _city = '';  // To store the entered city name

  void _fetchWeather() async {
    try {
      final data = await _weatherService.getTemperatureSummary(city: _city);  // Ensure city is passed
      setState(() {
        _weatherData = data;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _city = value;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: Text('Get Weather'),
            ),
            SizedBox(height: 16),
            _weatherData == null
                ? Text('Enter a city to get weather info')
                : Text('Temperature in $_city: ${_weatherData?['temperature']}°C'),
          ],
        ),
      ),
    );
  }
}
