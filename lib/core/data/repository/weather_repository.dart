import 'package:dio/dio.dart';
import 'package:toast/toast.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/core/data/models/weather_model.dart';

class WeatherService {
  final openWeatherAPIKey = 'f47bdbd3cc575321f125f007a13cad99';

  final Dio _dio = Dio();
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    print('$cityName');
    try {
      final url =
          "$BASE_URL_WEATHER?q=$cityName&units=metric&appid=$openWeatherAPIKey";
      final response = await _dio.get(url);
      print('The status code is ${response.statusCode}$cityName');

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
