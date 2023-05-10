import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:weather_app/api/api.dart';
import 'package:weather_app/core/data/models/weather_model.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late Future<Weather> weatherData;
  int index = 0;

  @override
  void initState() {
    super.initState();
    weatherData = WeatherService().getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Weather>(
          future: weatherData,
          builder: (context, snapshot) {
            var data = snapshot.data;
            if (snapshot.hasData) {
              var data = snapshot.data;
              print(data?.name);
            }
            return Center(
              child: Text("${data?.name}"),
            );
          }),
    );
  }
}
