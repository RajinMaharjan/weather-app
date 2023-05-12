import 'package:flutter/material.dart';
import 'package:weather_app/core/data/models/weather_model.dart';
import 'package:weather_app/presentation/widgets/icon_text_widget.dart';

class AddWeatherInfo extends StatefulWidget {
  final WeatherModel weatherModel;
  const AddWeatherInfo({super.key, required this.weatherModel});

  @override
  State<AddWeatherInfo> createState() => _AddWeatherInfoState();
}

class _AddWeatherInfoState extends State<AddWeatherInfo> {
  late Future<WeatherModel> weatherData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 100),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomIconTextWidget(
                icon: Icons.wind_power,
                val: '${widget.weatherModel.wind!.speed} km/h',
                name: 'Wind'),
            CustomIconTextWidget(
                icon: Icons.cloud,
                val: '${widget.weatherModel.clouds!.all} %',
                name: 'Cloud')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomIconTextWidget(
                icon: Icons.thermostat,
                val: '${widget.weatherModel.main!.pressure} mbar',
                name: 'Pressure'),
            CustomIconTextWidget(
                icon: Icons.water_drop_outlined,
                val: '${widget.weatherModel.main!.humidity}%',
                name: 'Humidity')
          ],
        ),
      ]),
    );
  }
}
