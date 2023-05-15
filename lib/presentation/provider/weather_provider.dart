import 'package:flutter/material.dart';
import 'package:weather_app/core/data/models/weather_model.dart';
import 'package:weather_app/core/data/repository/weather_repository.dart';

enum WeatherState { isLoading, completed, init }

abstract class WeatherProvider {
  getWeatherData({required String city});
}

class WeatherProviderImpl extends ChangeNotifier implements WeatherProvider {
  WeatherModel? _weatherModel;
  WeatherState weatherState = WeatherState.init;
  WeatherModel get weatherModel => _weatherModel!;

  @override
  Future<void> getWeatherData({required String city}) async {
    weatherState = WeatherState.isLoading;
    notifyListeners();
    _weatherModel = await WeatherService().getCurrentWeather(cityName: city);
    print("The cloud percentage is ${_weatherModel!.toJson()}");
    // weatherState = WeatherState.completed;
    notifyListeners();
  }
}
