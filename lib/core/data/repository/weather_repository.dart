import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:toast/toast.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/core/data/models/weather_model.dart';

class WeatherService {
  final openWeatherAPIKey = 'f47bdbd3cc575321f125f007a13cad99';

  final Dio _dio = Dio();
  Future<WeatherModel> getCurrentWeather() async {
    try {
      // Position position = await Geolocator.getCurrentPosition(
      //     desiredAccuracy: LocationAccuracy.high);
      // final lat = position.latitude;
      // final lon = position.longitude;
      // print("lat= $lat ---- lon = $lon");
      final url =
          "$BASE_URL_WEATHER?q=kathmandu&units=metric&appid=$openWeatherAPIKey";
      final response = await _dio.get(url);

      switch (response.statusCode) {
        case 200:
          WeatherModel weatherData = WeatherModel.fromJson(response.data);
          return weatherData;

        default:
          Toast.show("Failed to fetch data");
          throw 'failed to fetch data';
      }
    } on DioError catch (e) {
      print('Failed to fetch data: $e');
      throw 'ss';
    }
  }
}
