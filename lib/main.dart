import 'package:flutter/material.dart';
import 'package:flutter_bloc_exercise/modules/home_page/bloc/home_page_bloc.dart';
import 'package:flutter_bloc_exercise/modules/home_page/repositories/home_page_repo.dart';
import 'package:flutter_bloc_exercise/network/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/home_page/screen/home_page.dart';

void main() {
  final HomePageRepository homePageRepository = HomePageRepositoryImpl();
  runApp(MyApp(
      homePageBloc: HomePageBloc(homePageRepository: homePageRepository)));
}

class MyApp extends StatelessWidget {
  final HomePageBloc homePageBloc;

  const MyApp({super.key, required this.homePageBloc});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<HomePageBloc>(
        create: (context) => homePageBloc,
        child: HomePage(homePageBloc: homePageBloc,),
      ),
    );
  }
}