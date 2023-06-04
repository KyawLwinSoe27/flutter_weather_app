part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();
  @override
  List<Object> get props => [];
}

class HomePageInitialState extends HomePageState {}

class HomePageLoadingState extends HomePageState {}

class HomePageLoadedState extends HomePageState {
  final WeatherResponse weatherResponse;
  const HomePageLoadedState(this.weatherResponse);
}

class HomePageErrorState extends HomePageState {
  final String errorMessage;
  const HomePageErrorState(this.errorMessage);
}

class WeatherResponseForecastLoadedState extends HomePageState {
  final WeatherForecastResponse weatherForecastResponse;
  const WeatherResponseForecastLoadedState(this.weatherForecastResponse);
}