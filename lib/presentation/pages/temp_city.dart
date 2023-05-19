import 'package:flutter/material.dart';
import 'package:weather_app/core/data/models/weather_model.dart';

class TempCity extends StatefulWidget {
  final WeatherModel weatherModel;
  const TempCity({super.key, required this.weatherModel});

  @override
  State<TempCity> createState() => _TempCityState();
}

class _TempCityState extends State<TempCity> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Center(
            child: Text(
              '${widget.weatherModel.name}, ${widget.weatherModel.sys!.country}',
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Image.network(
            'https://openweathermap.org/img/wn/${widget.weatherModel.weather![0].icon}@2x.png',
            height: 100,
            width: 100,
          ),
          Text(
            ' ${widget.weatherModel.weather![0].description}',
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '${widget.weatherModel.main?.temp?.round()} °C',
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Column(
                children: [
                  const Text(
                    'Feels Like ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    '${widget.weatherModel.main?.feelsLike?.round()}°C',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'lat: ${widget.weatherModel.coord!.lat}',
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 25,
                child: VerticalDivider(
                  color: Colors.white70,
                  thickness: 2,
                  width: 20,
                ),
              ),
              Text(
                'long: ${widget.weatherModel.coord!.lon}',
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
