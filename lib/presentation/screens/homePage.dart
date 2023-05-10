import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:weather_app/api/api.dart';
import 'package:weather_app/core/data/models/test_model.dart';
import 'package:weather_app/core/data/models/weather_model.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late Future<WeatherTest> weatherData;
  int index = 0;

  @override
  void initState() {
    super.initState();
    WeatherService weatherService = WeatherService();
    weatherData = weatherService.getCurrentWeather() as Future<WeatherTest>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<WeatherTest>(
          future: weatherData,
          builder: (context, snapshot) {
            var data = snapshot.data;
            if (snapshot.hasData) {
              var data = snapshot.data;
              print(data?.current?.feelsLike);
            }
            return Center(
              child: Text("${data?.current?.feelsLike}"),
            );
          }),
    );
  }
}
