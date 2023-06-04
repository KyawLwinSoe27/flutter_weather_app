import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_exercise/data/models/hour_model.dart';
import 'package:flutter_bloc_exercise/modules/home_page/bloc/home_page_bloc.dart';

class HomePage extends StatefulWidget {
  final HomePageBloc homePageBloc;
  const HomePage({Key? key, required this.homePageBloc}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DateTime now = DateTime(2002, 5, 25);
  final String city = "Mandalay";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomePageBloc>(context).add(FetchWeatherEvent(city));
    BlocProvider.of<HomePageBloc>(context).add(
        FetchWeatherForecastEvent(city));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.yellow,
        leading: const Icon(
          Icons.chevron_left,
          color: Colors.black,
        ),
        title: Text(
          "Weather App (${city})",
          style: const TextStyle(color: Colors.black),
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.black,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CurrentTimeData(now: now),
            Spacer(),
            ForecastHorizontalList(),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class ForecastHorizontalList extends StatelessWidget {
  const ForecastHorizontalList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        if(state is HomePageLoadingState) {
          return const CircularProgressIndicator();
        } else if (state is WeatherResponseForecastLoadedState) {
          return Container(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.weatherForecastResponse.forecastModel!.forecastday![0].hour!.length,
                itemBuilder: (BuildContext context, int index) {
                  String? conditionImage =
                      "https:${state.weatherForecastResponse.currentModel!.condition!.icon}";
                  List<HourModel>? hourList = state.weatherForecastResponse.forecastModel!.forecastday![0].hour;
                  return Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 2.0, vertical: 2.0),
                    width: 100,
                    height: 150,
                    child: Column(
                      children: [
                        const Spacer(),
                        Text(getTime(hourList![index].time)),
                        const Spacer(),
                        Image.network("https:${state.weatherForecastResponse.forecastModel!.forecastday![0].hour![index].condition.icon}"),
                        const Spacer(),
                        Text("${state.weatherForecastResponse.forecastModel!.forecastday![0].hour![index].tempC}\u00B0"),
                        const Spacer()
                      ],
                    ),
                  );
                }),
          );
        } else if( state is HomePageErrorState) {
          return const Center(child: Text("Error"),);
        } else {
          return Container();
        }

      },
    );
  }
}

class CurrentTimeData extends StatelessWidget {
  const CurrentTimeData({
    super.key,
    required this.now,
  });

  final DateTime now;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        if (state is HomePageLoadingState) {
          return const CircularProgressIndicator();
        } else if (state is WeatherResponseForecastLoadedState) {
          String? name = state.weatherForecastResponse.locationModel?.name;
          String? date = state.weatherForecastResponse.locationModel!.localtime;
          String? conditionImage =
              "https:${state.weatherForecastResponse.currentModel!.condition!.icon}";
          String? conditionText =
              state.weatherForecastResponse.currentModel!.condition!.text;
          int? tempC = state.weatherForecastResponse.currentModel!.tempC!.toInt();
          double? windKph = state.weatherForecastResponse.currentModel!.windKph;
          int? humidity = state.weatherForecastResponse.currentModel!.humidity;
          return SizedBox(
            height: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on_sharp),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(name ?? ""),
                      const Spacer(),
                      Text(date?.substring(0, 10) ??
                          now.toString().substring(0, 10)),
                    ],
                  ),
                ),
                const Spacer(),
                Image.network(
                  conditionImage,
                  scale: 0.5,
                ),
                Text(conditionText!),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  "${tempC.toString()}\u00B0",
                  style: TextStyle(fontSize: 50),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.air_outlined),
                        const SizedBox(width: 10.0,),
                        Text("${windKph.toString()}km/h")
                      ],
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.water_drop_outlined),
                        const SizedBox(width: 10.0,),
                        Text("${humidity.toString()}%"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        } else if (state is HomePageErrorState) {
          return const Center(
            child: Text("App is being error state"),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

String getTime(String time) {
  return time.substring(11,16);
}