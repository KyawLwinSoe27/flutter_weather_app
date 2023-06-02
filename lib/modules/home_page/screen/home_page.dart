import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading:const Icon(Icons.chevron_left),
        title:const Text("Weather App"),
        actions:const [
          Icon(Icons.search)
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0,left: 10.0,right: 10.0),
              child: Row(
                children: [
                  Icon(Icons.location_on_sharp),
                  SizedBox(width: 10.0,),
                  Text("Yangon"),
                  Spacer(),
                  Text(now.toString().substring(0,10)),
                ],
              ),
            ),
            const Spacer(),
            BoxedIcon(WeatherIcons.cloud,size: 80,),
            Text("It's hot"),
            const SizedBox(height: 80.0,),
            Text("28",style: TextStyle(fontSize: 40),),
            const SizedBox(height: 50.0,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(Icons.air_outlined),
                    Text("10km/h")
                  ],
                ),
                SizedBox(width: 30.0,),
                Row(
                  children: [
                    Icon(Icons.water_drop_outlined),
                    Text("47%")
                  ],
                ),
              ],
            ),
            Spacer(),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 24,
                  itemBuilder:
                  (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    margin:const EdgeInsets.symmetric(horizontal: 2.0,vertical: 2.0),
                    width: 100,
                    height: 150,
                    child: Column(
                      children: [
                        const Spacer(),
                        Text("${index + 1}:00 AM"),
                        const Spacer(),
                        BoxedIcon(WeatherIcons.sunrise),
                        const Spacer(),
                        Text("30"),
                        const Spacer()
                      ],
                    ),
                  ) ;
              }),
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
