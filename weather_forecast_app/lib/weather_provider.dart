// lib/weather_provider.dart

import 'package:flutter/material.dart';
import 'services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  String? weatherData; 

  Future<void> getWeather(String cityName, String unit) async {
    weatherData = await WeatherService.getWeather(cityName, unit); // This now matches the return type
    notifyListeners(); // Notify listeners when the data changes
  }
}

