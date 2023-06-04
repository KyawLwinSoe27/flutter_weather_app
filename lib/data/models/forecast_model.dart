import 'forecast_day.dart';

class ForecastModel {
  List<ForecastDay>? forecastday;

  ForecastModel({this.forecastday});

  ForecastModel.fromJson(Map<String,dynamic> json) {
    if(json["forecastday"] != null) {
      forecastday = <ForecastDay>[];
      json["forecastday"].forEach((f) {
          forecastday!.add(ForecastDay.fromJson(f));
      });
    }
  }
}