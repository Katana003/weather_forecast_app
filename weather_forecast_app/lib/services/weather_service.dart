// lib/services/weather_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String apiKey = 'https://app.swaggerhub.com/apis/XHIZO034/Xhizo034/1.0.0'; //  The Real API key
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  // Update the return type to Future<String>
  static Future<String> getWeather(String cityName, String unit) async {
    final String url = '$baseUrl?q=$cityName&units=$unit&appid=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Extract relevant weather data
      final String weatherDescription = data['weather'][0]['description'];
      final double temperature = data['main']['temp'];
      return 'Weather in $cityName: $weatherDescription, Temperature: $temperature°';
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

