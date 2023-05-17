import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/data/models/weather_model.dart';
import 'package:weather_app/core/data/repository/weather_repository.dart';

enum WeatherState {
  isLoading,
  completed,
  init,
  connErr,
  reqErr,
  sendErr,
  defErr,
  badResErr,
  conTimeOut,
}

abstract class WeatherProvider {
  getWeatherData({required String city});
}

class WeatherProviderImpl extends ChangeNotifier implements WeatherProvider {
  WeatherModel? _weatherModel;
  String? error;
  WeatherState weatherState = WeatherState.init;
  WeatherModel get weatherModel => _weatherModel!;

  @override
  Future<void> getWeatherData({required String city}) async {
    try {
      if (_weatherModel == null) {
        weatherState = WeatherState.isLoading;
        notifyListeners();
      }

      _weatherModel = await WeatherService().getCurrentWeather(cityName: city);
      print("The cloud percentage is ${_weatherModel!.toJson()}");
      weatherState = WeatherState.completed;
      notifyListeners();
    } catch (e) {
      print('err ${e}');
      switch (e) {
        case 'noConn':
          weatherState = WeatherState.connErr;
          break;
        case 'connTimeOut':
          weatherState = WeatherState.conTimeOut;
          break;
        case 'unkCity':
          weatherState = WeatherState.sendErr;
          break;
        case 'loadCityErr':
          weatherState = WeatherState.reqErr;
          break;
        case 'badRes':
          weatherState = WeatherState.badResErr;
          break;
        default:
          weatherState = WeatherState.defErr;
      }
    }
    notifyListeners();
  }
}
