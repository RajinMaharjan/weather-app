import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/presentation/pages/homePage.dart';
import 'package:weather_app/presentation/provider/weather_provider.dart';
import 'package:weather_app/presentation/widgets/loading_indicator.dart';

class DecisionPage extends StatefulWidget {
  const DecisionPage({super.key});

  @override
  State<DecisionPage> createState() => _DecisionPageState();
}

class _DecisionPageState extends State<DecisionPage> {
  @override
  void initState() {
    super.initState();

    WeatherProviderImpl weatherProvider =
        Provider.of<WeatherProviderImpl>(context, listen: false);

    weatherProvider.getWeatherData(city: "Kathmandu");
    print("aa");
  }

  Future<void> _refreshData(String? city) async {
    WeatherProviderImpl weatherProvider =
        Provider.of<WeatherProviderImpl>(context, listen: false);

    await weatherProvider.getWeatherData(city: city!);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProviderImpl>(builder: (context, response, _) {
      switch (response.weatherState) {
        case WeatherState.connErr:
          return HomePage(
            isTrue: false,
            err: "No internet connection.",
            img: ImgUrls.connectionError,
          );
        case WeatherState.conTimeOut:
          return HomePage(
            isTrue: false,
            err: "Failed to connect to the network.",
            img: ImgUrls.connectionError,
          );
        case WeatherState.reqErr:
          return HomePage(
            isTrue: false,
            err: "Failed to fetch city.",
            img: ImgUrls.cityError,
          );
        case WeatherState.sendErr:
          return HomePage(
            isTrue: false,
            err: "Unknown City Name",
            img: ImgUrls.cityError,
          );
        case WeatherState.badResErr:
          return HomePage(
            isTrue: false,
            err: "Unknown City Name",
            img: ImgUrls.cityError,
          );
        case WeatherState.defErr:
          return HomePage(
            isTrue: false,
            err: "Unknown Error",
            img: ImgUrls.unknownError,
          );
        case WeatherState.completed:
          final weatherData = response.weatherModel;
          return HomePage(
            isTrue: true,
            weatherModel: weatherData,
          );
        case WeatherState.isLoading:
          return const LoadingIndicator();
        default:
          return const LoadingIndicator();
      }
    });
  }
}
