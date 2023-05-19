import 'package:flutter/material.dart';

const String BASE_URL_WEATHER =
    "https://api.openweathermap.org/data/2.5/weather";

class AppColors {
  static const rainBlueLight = Color(0xFF4480C6);
  static const rainBlueDark = Color(0xFF364699);
  static const rainGradient = [rainBlueLight, rainBlueDark];
  static const accentColor = Color(0xFFe96e50);
}

class ImagePath {
  static const String cityError = "images/city.png";
  static const String connectionError = "images/internet.png";
  static const String unknownError = "images/unknown_error.png";
  static const String weather = "images/weather.png";
}

double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
