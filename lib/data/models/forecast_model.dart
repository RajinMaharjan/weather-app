import 'package:weather_app/data/models/weather_model.dart';

class Forecast {
  DateTime? lastUpdated;
  double? longitude;
  double? latitude;
  List<Weather>? daily;
  Weather? current;
  bool? isDayTime;
  String? city;

  Forecast({
    this.lastUpdated,
    this.longitude,
    this.latitude,
    this.daily = const [],
    this.current,
    this.isDayTime,
    this.city,
  });
}
