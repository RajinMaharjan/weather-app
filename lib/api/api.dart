import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:toast/toast.dart';
import 'package:weather_app/core/data/models/test_model.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/core/data/models/weather_model.dart';

// class WeatherService {
//   final openWeatherAPIKey = 'f47bdbd3cc575321f125f007a13cad99';
//   final lat = 27.742495;
//   final lon = 85.339207;

//   final Dio _dio = Dio();
//   Future<Weather> getCurrentWeather() async {
//     try {
//       final url = "$BASE_URL?lat=$lat&lon=$lon&appid=$openWeatherAPIKey";
//       final response = await _dio.get(url);

//       switch (response.statusCode) {
//         case 200:
//           Weather weatherData = Weather.fromJson(response.data);
//           return weatherData;

//         default:
//           Toast.show("Failed to fetch data");
//           throw 'failed to fetch data';
//       }
//     } on DioError catch (e) {
//       print('Failed to fetch data: $e');
//       throw 'ss';
//     }
//   }
// }
class WeatherService {
  final openWeatherAPIKey = 'f47bdbd3cc575321f125f007a13cad99';
  final lat = 27.742495;
  final lon = 85.339207;

  final Dio _dio = Dio();
  Future<Either<WeatherTest, String>> getCurrentWeather() async {
    try {
      final url = "$BASE_URL?lat=$lat&lon=$lon&appid=$openWeatherAPIKey";
      final response = await _dio.get(url);
      WeatherTest weatherData = WeatherTest.fromJson(response.data);
      return left(weatherData);
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case 401:
        default:
          return right("Something went wrong");
      }
    }
  }
}
