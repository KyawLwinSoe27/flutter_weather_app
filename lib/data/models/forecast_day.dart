import 'package:flutter_bloc_exercise/data/models/astro_model.dart';
import 'package:flutter_bloc_exercise/data/models/day_model.dart';

import 'hour_model.dart';

class ForecastDay {
  String? date;
  DayModel? day;
  AstroModel? astro;
  List<HourModel>? hour;

  ForecastDay({this.date, this.day, this.astro, this.hour});

  ForecastDay.fromJson(Map<String, dynamic> json) {
    date = json["date"];
    day = DayModel.fromJson(json["day"]);
    astro = AstroModel.fromJson(json["astro"]);
    if (json["hour"] != null) {
      hour = <HourModel>[];
      json["hour"].forEach((h) {
        hour!.add(HourModel.fromJson(h));
      });
    }
  }

  // Map<String, dynamic> toJson() => {
  //   "date": date,
  //   "day": day?.toJson(),
  //   "astro": astro?.toJson(),
  //   "hour": List<HourModel>.from(hour?.map((x) => x)),
  // };
}

