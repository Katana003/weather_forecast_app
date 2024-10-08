// lib/weather_home_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'weather_provider.dart';

class WeatherHomePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter city name',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                String cityName = _controller.text;
                String unit = 'metric'; // or 'imperial' for Fahrenheit
                await weatherProvider.getWeather(cityName, unit);
              },
              child: Text('Get Weather'),
            ),
            SizedBox(height: 20),
            Text(weatherProvider.weatherData ?? 'Your Expriencing Issues'),
          ],
        ),
      ),
    );
  }
}

