import 'package:flutter_bloc_exercise/data/models/current_model.dart';

import '../../data/models/forecast_model.dart';
import '../../data/models/location_model.dart';

class WeatherResponse {
  LocationModel? locationModel;
  CurrentModel? currentModel;

  WeatherResponse({
    required this.locationModel,
    required this.currentModel,
});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) => WeatherResponse(
    locationModel: LocationModel.fromJson(json["location"]),
    currentModel: CurrentModel.fromJson(json["current"])
  );

  Map<String, dynamic> toJson() => {
    "locationModel": locationModel?.toJson(),
    "currentModel": currentModel?.toJson(),
  };

}