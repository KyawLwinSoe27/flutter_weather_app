import 'package:flutter_bloc_exercise/network/api_service.dart';
import 'package:flutter_bloc_exercise/network/responses/weather_forecast_response.dart';
import 'package:flutter_bloc_exercise/network/responses/weather_response.dart';

abstract class HomePageRepository{
  Future<WeatherResponse> fetchWeather(String city);
  Future<WeatherForecastResponse> fetchWeatherForecast(String city);
}
class HomePageRepositoryImpl extends HomePageRepository {
  @override
  Future<WeatherResponse> fetchWeather(String city) {
    final ApiService apiService = ApiService();
    return apiService.fetchWeather(city);
  }

  @override
  Future<WeatherForecastResponse> fetchWeatherForecast(String city) {
    final ApiService apiService = ApiService();
    return apiService.fetchWeatherForecast(city);
  }
}