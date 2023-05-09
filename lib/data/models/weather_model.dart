// f47bdbd3cc575321f125f007a13cad99
enum WeatherCondition {
  thunderstorm,
  drizzle,
  rain,
  snow,
  atmosphere,
  mist,
  fog,
  lightCloud,
  heavyCloud,
  clear,
  unknown
}

class Weather {
  WeatherCondition? condition;
  String? description;
  double? temp;
  double? feelLikeTemp;
  int? cloudiness;
  DateTime? date;

  Weather({
    this.condition,
    this.description,
    this.temp,
    this.feelLikeTemp,
    this.cloudiness,
    this.date,
  });
}
