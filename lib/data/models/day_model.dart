import 'package:flutter_bloc_exercise/data/models/condition_model.dart';

class DayModel {
  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;
  double? avgtempC;
  double? avgtempF;
  double? maxwindMph;
  double? maxwindKph;
  double? avghumidity;
  ConditionModel? condition;
  double? uv;

  DayModel({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.avghumidity,
    required this.condition,
    required this.uv,
  });

  factory DayModel.fromJson(Map<String, dynamic> json) => DayModel(
        maxtempC: json["maxtemp_c"],
        maxtempF: json["maxtemp_f"],
        mintempC: json["mintemp_c"],
        mintempF: json["mintemp_f"],
        avgtempC: json["avgtemp_c"],
        avgtempF: json["avgtemp_f"],
        maxwindMph: json["maxwind_mph"],
        maxwindKph: json["maxwind_kph"],
        avghumidity: json["avghumidity"],
        condition: ConditionModel?.fromJson(json["condition"]),
        uv: json["uv"],
      );

  Map<String, dynamic> toJson() => {
        "maxtemp_c": maxtempC,
        "maxtemp_f": maxtempF,
        "mintemp_c": mintempC,
        "mintemp_f": mintempF,
        "avgtemp_c": avgtempC,
        "avgtemp_f": avgtempF,
        "maxwind_mph": maxwindMph,
        "maxwind_kph": maxwindKph,
        "avghumidity": avghumidity,
        "condition": condition?.toJson(),
        "uv": uv,
      };
}
