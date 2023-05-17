import 'package:flutter/material.dart';

const String BASE_URL_WEATHER =
    "https://api.openweathermap.org/data/2.5/weather";

class AppColors {
  static const rainBlueLight = Color(0xFF4480C6);
  static const rainBlueDark = Color(0xFF364699);
  static const rainGradient = [rainBlueLight, rainBlueDark];
  static const accentColor = Color(0xFFe96e50);
}

class ImgUrls {
  static const String city = "images/city.png";
  static const String conn = "images/connection.png";
  static const String unknown_err = "images/unknown_error.png";
}
