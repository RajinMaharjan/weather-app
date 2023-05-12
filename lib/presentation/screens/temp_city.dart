import 'package:flutter/material.dart';
import 'package:weather_app/core/data/models/weather_model.dart';
import 'package:weather_app/core/data/repository/weather_repository.dart';

class TempCity extends StatefulWidget {
  const TempCity({super.key});

  @override
  State<TempCity> createState() => _TempCityState();
}

class _TempCityState extends State<TempCity> {
  late Future<WeatherModel> weatherData;

  @override
  void initState() {
    super.initState();
    WeatherService weatherService = WeatherService();

    weatherData = weatherService.getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherModel>(builder: ((context, snapshot) {
      if (snapshot.hasData) {
        return Center();
      } else {
        return Center();
      }
    }));
    return Center(
      child: FutureBuilder<WeatherModel>(
          future: weatherData,
          builder: (context, snapshot) {
            print("The error is ${snapshot.hasError}");
            if (snapshot.hasData) {
              var data = snapshot.data;
              return Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      '${data?.name}',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Image.network(
                    'https://openweathermap.org/img/wn/${data?.weather![0].icon}@2x.png',
                    height: 100,
                    width: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            '${data?.main?.temp?.round()} ',
                            style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            'Feels Like ${data?.main?.feelsLike?.round()}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }
            return const Center();
          }),
    );
  }
}
