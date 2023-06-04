import 'package:flutter_bloc_exercise/data/models/condition_model.dart';

class HourModel {
  int timeEpoch;
  String time;
  double tempC;
  double tempF;
  int isDay;
  ConditionModel condition;
  double windMph;
  double windKph;
  int windDegree;
  String windDir;
  double pressureMb;
  double pressureIn;
  int humidity;
  int cloud;
  int willItRain;
  int chanceOfRain;
  int willItSnow;
  int chanceOfSnow;
  double uv;

  HourModel({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.humidity,
    required this.cloud,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.uv,
  });

  factory HourModel.fromJson(Map<String, dynamic> json) => HourModel(
    timeEpoch: json["time_epoch"],
    time: json["time"],
    tempC: json["temp_c"],
    tempF: json["temp_f"],
    isDay: json["is_day"],
    condition: ConditionModel.fromJson(json["condition"]),
    windMph: json["wind_mph"],
    windKph: json["wind_kph"],
    windDegree: json["wind_degree"],
    windDir: json["wind_dir"],
    pressureMb: json["pressure_mb"],
    pressureIn: json["pressure_in"],
    humidity: json["humidity"],
    cloud: json["cloud"],
    willItRain: json["will_it_rain"],
    chanceOfRain: json["chance_of_rain"],
    willItSnow: json["will_it_snow"],
    chanceOfSnow: json["chance_of_snow"],
    uv: json["uv"],
  );

  Map<String, dynamic> toJson() => {
    "time_epoch": timeEpoch,
    "time": time,
    "temp_c": tempC,
    "temp_f": tempF,
    "is_day": isDay,
    "condition": condition.toJson(),
    "wind_mph": windMph,
    "wind_kph": windKph,
    "wind_degree": windDegree,
    "wind_dir": windDir,
    "pressure_mb": pressureMb,
    "pressure_in": pressureIn,
    "humidity": humidity,
    "cloud": cloud,
    "will_it_rain": willItRain,
    "chance_of_rain": chanceOfRain,
    "will_it_snow": willItSnow,
    "chance_of_snow": chanceOfSnow,
    "uv": uv,
  };
}