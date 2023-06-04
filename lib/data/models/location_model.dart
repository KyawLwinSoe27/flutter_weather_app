import 'dart:core';

class LocationModel {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? localtime;

  LocationModel({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.localtime,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    name: json["name"],
    region: json["region"],
    country: json["country"],
    lat: json["lat"],
    lon: json["lon"],
    localtime: json["localtime"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "region": region,
    "country": country,
    "lat": lat,
    "lon": lon,
    "localtime": localtime,
  };
}
