import 'package:flutter/material.dart';
import 'package:weather_app/core/data/models/weather_model.dart';
import 'package:weather_app/core/data/repository/weather_repository.dart';

enum WeatherState {
  isLoading,
  completed,
  init,
  hasError,
}

enum Error {
  connection,
  request,
  send,
  defaultError,
  response,
  connectionTimeOut,
}

abstract class WeatherProvider {
  getWeatherData({required String city});
}

class WeatherProviderImpl extends ChangeNotifier implements WeatherProvider {
  WeatherModel? _weatherModel;
  Error error = Error.defaultError;
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
      // print("The cloud percentage is ${_weatherModel!.toJson()}");
      weatherState = WeatherState.completed;
      notifyListeners();
    } catch (e) {
      print('err ${e}');
      switch (e) {
        case 'noConnection':
          error = Error.connection;
          // print("The error connection is $e.");
          notifyListeners();
          break;
        case 'connectionTimeOut':
          error = Error.connectionTimeOut;
          // print("The error connectionTimeout is $e.");
          notifyListeners();
          break;
        case 'unknownCity':
          error = Error.send;
          // print("The error Send is $e.");
          notifyListeners();
          break;
        case 'cityLoadError':
          error = Error.request;
          // print("The error request is $e.");
          notifyListeners();
          break;
        case 'badResponse':
          error = Error.response;
          // print("The error bad res is $e.");
          notifyListeners();
          break;
        default:
          error = Error.defaultError;
          // print("The error default is $e.");
          notifyListeners();
      }
      weatherState = WeatherState.hasError;
      notifyListeners();
    }
    notifyListeners();
  }
}
