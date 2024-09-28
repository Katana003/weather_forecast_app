import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  //  Actual API base URL
  static const String baseUrl = 'https://app.swaggerhub.com'; // actual base URL

  final String apiKey = 'https://app.swaggerhub.com/apis/XHIZO034/Xhizo034/1.0.0'; //  actual API key

  // Method to get temperature summary for a specific city
  Future<Map<String, dynamic>> getTemperatureSummary({required String city}) async {
    final response = await http.get(Uri.parse('$baseUrl/temperature?city=$city&apikey=$apiKey'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load temperature summary');
    }
  }

  // Method to get temperature forecast for a number of days
  Future<Map<String, dynamic>> getTemperatureForecast(int days) async {
    final response = await http.get(Uri.parse('$baseUrl/temperature/forecast/$days?apikey=$apiKey'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load temperature forecast');
    }
  }
}

