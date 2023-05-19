import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/presentation/pages/homePage.dart';
import 'package:weather_app/presentation/pages/loading_page.dart';
import 'package:weather_app/presentation/provider/weather_provider.dart';

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
    // print("aa");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProviderImpl>(builder: (context, response, _) {
      switch (response.weatherState) {
        case WeatherState.completed:
          final weatherData = response.weatherModel;
          return HomePage(
            isTrue: true,
            weatherModel: weatherData,
          );
        case WeatherState.isLoading:
          return const LoadingPage();
        case WeatherState.hasError:
          {
            switch (response.error) {
              case Error.connection:
                return HomePage(
                  isTrue: false,
                  err: "No internet connection.",
                  img: ImagePath.connectionError,
                );
              case Error.connectionTimeOut:
                return HomePage(
                  isTrue: false,
                  err: "Failed to connect to the network.",
                  img: ImagePath.connectionError,
                );
              case Error.request:
                return HomePage(
                  isTrue: false,
                  err: "Failed to fetch city.",
                  img: ImagePath.cityError,
                );
              case Error.send:
                return HomePage(
                  isTrue: false,
                  err: "Unknown City Name",
                  img: ImagePath.cityError,
                );
              case Error.response:
                return HomePage(
                  isTrue: false,
                  err: "Unknown City Name",
                  img: ImagePath.cityError,
                );
              default:
                return HomePage(
                  isTrue: false,
                  err: "No internet connection",
                  img: ImagePath.connectionError,
                );
            }
          }
        default:
          return const LoadingPage();
      }
    });
  }
}
