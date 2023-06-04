import 'package:flutter_bloc_exercise/network/responses/weather_forecast_response.dart';
import 'package:flutter_bloc_exercise/network/responses/weather_response.dart';
import 'api_constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<WeatherResponse> fetchWeather(String city) async{
    const apiKey = apiKeyS;
    final apiUrl = "${apiConstant}current.json?key=$apiKey&q=$city";
    final response = await http.get(Uri.parse(apiUrl));
    if(response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      return WeatherResponse.fromJson(jsonBody);
    }else {
      throw Exception('Failed to fetch weather data');
    }
  }

  Future<WeatherForecastResponse> fetchWeatherForecast(String city) async {
    const apiKey = apiKeyS;
    final apiUrl = "${apiConstant}forecast.json?key=$apiKey&q=$city";
    final response = await http.get(Uri.parse(apiUrl));
    if(response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      return WeatherForecastResponse.fromJson(jsonBody);
    }else {
      throw Exception('Failed to fetch weather data');
    }
  }
}