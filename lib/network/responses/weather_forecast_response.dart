import 'package:flutter_bloc_exercise/data/models/current_model.dart';
import 'package:flutter_bloc_exercise/data/models/forecast_model.dart';
import 'package:flutter_bloc_exercise/data/models/location_model.dart';

class WeatherForecastResponse {
  LocationModel? locationModel;
  CurrentModel? currentModel;
  ForecastModel? forecastModel;

  WeatherForecastResponse({
    required this.locationModel,
    required this.currentModel,
    required this.forecastModel
  });

  factory WeatherForecastResponse.fromJson(Map<String, dynamic> json) => WeatherForecastResponse(
      locationModel: LocationModel.fromJson(json["location"]),
      currentModel: CurrentModel.fromJson(json["current"]),
      forecastModel: ForecastModel.fromJson(json["forecast"])
  );

  Map<String, dynamic> toJson() => {
    "locationModel": locationModel?.toJson(),
    "currentModel": currentModel?.toJson(),
  };
}