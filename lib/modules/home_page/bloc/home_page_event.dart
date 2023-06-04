part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();
  @override
  List<Object?> get props => [];
}

class FetchWeatherEvent extends HomePageEvent {
  final String city;
  const FetchWeatherEvent(this.city);
}

class FetchWeatherForecastEvent extends HomePageEvent {
  final String city;
  const FetchWeatherForecastEvent(this.city);
}