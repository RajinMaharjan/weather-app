import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/data/models/weather_model.dart';
import 'package:weather_app/core/data/repository/weather_repository.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/presentation/pages/add_weather_info.dart';
import 'package:weather_app/presentation/pages/city_entry_bar.dart';
import 'package:weather_app/presentation/pages/temp_city.dart';
import 'package:weather_app/presentation/provider/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<WeatherModel> weatherData;

  @override
  void initState() {
    super.initState();
    WeatherProviderImpl weatherProvider =
        Provider.of<WeatherProviderImpl>(context, listen: false);
    weatherProvider.getWeatherData(city: "Lalitpur");

    // WeatherService weatherService = WeatherService();

    // weatherData = weatherService.getCurrentWeather(cityName: 'Kathmandu');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<WeatherProviderImpl>(builder: (context, response, _) {
      // weatherData = response.;
      print("thr weater state is ${response.weatherState}");
      switch (response.weatherState) {
        case WeatherState.completed:
          print("The data is ${response.weatherModel.toJson()}");
          return Container();
        case WeatherState.isLoading:
        default:
          return CircularProgressIndicator();
      }
    })

        //  FutureBuilder<WeatherModel>(
        //     future: weatherData,
        //     builder: (context, snapshot) {
        //       var data = snapshot.data;

        //       print("The error is ${snapshot.hasError}");
        //       print("${data?.coord?.lat}");
        //       print("${data?.coord?.lon}");
        //       print("${data?.clouds!.all}");
        //       print("${data?.main!.feelsLike}");
        //       if (snapshot.hasData) {
        //         return Container(
        //           width: double.infinity,
        //           decoration: const BoxDecoration(
        //             gradient: LinearGradient(
        //               begin: Alignment.topCenter,
        //               end: Alignment.bottomCenter,
        //               colors: AppColors.rainGradient,
        //             ),
        //           ),
        //           child: SafeArea(
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //               children: [
        //                 CityEntryBar(),
        //                 TempCity(
        //                   weatherModel: snapshot.data!,
        //                 ),
        //                 AddWeatherInfo(
        //                   weatherModel: snapshot.data!,
        //                 ),
        //               ],
        //             ),
        //           ),
        //         );
        //       } else {
        //         return const Center(
        //             child: CircularProgressIndicator(
        //           backgroundColor: AppColors.rainBlueDark,
        //         ));
        //       }
        //     }),

        );
  }
}
