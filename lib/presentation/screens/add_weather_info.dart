import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weather_app/core/data/models/weather_model.dart';
import 'package:weather_app/core/data/repository/weather_repository.dart';

class AddWeatherInfo extends StatefulWidget {
  const AddWeatherInfo({super.key});

  @override
  State<AddWeatherInfo> createState() => _AddWeatherInfoState();
}

class _AddWeatherInfoState extends State<AddWeatherInfo> {
  late Future<WeatherModel> weatherData;

  @override
  void initState() {
    super.initState();
    WeatherService weatherService = WeatherService();

    weatherData = weatherService.getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<WeatherModel>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return Column(
              children: [],
            );
          }
          return Dialog(
            child: Text('G'),
          );
        },
      ),
    );
  }
}
