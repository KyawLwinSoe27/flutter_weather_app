import 'condition_model.dart';

class CurrentModel {
  String? lastUpdated;
  int? isDay;
  double? tempC;
  double? tempF;
  ConditionModel? condition;
  double? windMph;
  double? windKph;
  String? windDir;
  double? pressureMb;
  int? humidity;

  CurrentModel(
      {required this.lastUpdated,
      required this.isDay,
      required this.tempC,
      required this.tempF,
      required this.condition,
      required this.windMph,
      required this.windKph,
      required this.windDir,
      required this.pressureMb,
      required this.humidity});

  factory CurrentModel.fromJson(Map<String, dynamic> json) => CurrentModel(
      lastUpdated: json["last_updated"],
      isDay: json["is_day"],
      tempC: json["temp_c"],
      tempF: json["temp_f"],
      condition: ConditionModel?.fromJson(json["condition"]),
      windMph: json["wind_mph"],
      windKph: json["wind_kph"],
      windDir: json["wind_dir"],
      pressureMb: json["pressure_mb"],
      humidity: json["humidity"]);

  Map<String, dynamic> toJson() => {
        "last_updated": lastUpdated,
        "is_day": isDay,
        "temp_c": tempC,
        "temp_f": tempF,
        "condition": condition?.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "humidity": humidity
      };
}
