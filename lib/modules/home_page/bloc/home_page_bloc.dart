import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_exercise/modules/home_page/repositories/home_page_repo.dart';
import 'package:flutter_bloc_exercise/network/responses/weather_forecast_response.dart';
import 'package:flutter_bloc_exercise/network/responses/weather_response.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final HomePageRepository homePageRepository;
  HomePageBloc({required this.homePageRepository}) : super(HomePageInitialState()) {
    on<FetchWeatherEvent>((event, emit) async{
      try{
        var res = await homePageRepository.fetchWeather(event.city);
        emit(HomePageLoadedState(res));
      }catch(e) {
        print(e.toString());
        emit(const HomePageErrorState("no data"));
      }
    });

    on<FetchWeatherForecastEvent>((event,emit) async {
      try{
        var res = await homePageRepository.fetchWeatherForecast(event.city);
        emit(WeatherResponseForecastLoadedState(res));
      }catch(e) {
        print(e.toString());
        emit(const HomePageErrorState("no data"));
      }
    });
  }
}
