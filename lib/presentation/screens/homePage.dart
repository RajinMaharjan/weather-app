import 'package:flutter/material.dart';
import 'package:weather_app/core/data/models/weather_model.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/presentation/screens/add_weather_info.dart';
import 'package:weather_app/presentation/screens/city_entry_bar.dart';
import 'package:weather_app/presentation/screens/temp_city.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.rainGradient,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CityEntryBar(),
              TempCity(),
              AddWeatherInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
