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
  @override
  void initState() {
    super.initState();
    WeatherProviderImpl weatherProvider =
        Provider.of<WeatherProviderImpl>(context, listen: false);

    weatherProvider.getWeatherData(city: "Kathmandu");
    print("aa");

    // WeatherService weatherService = WeatherService();

    // weatherData = weatherService.getCurrentWeather(cityName: 'Kathmandu');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<WeatherProviderImpl>(builder: (context, response, _) {
      print("the weather state is ${response.weatherState}");
      switch (response.weatherState) {
        case WeatherState.completed:
          final weatherData = response.weatherModel;
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: AppColors.rainGradient,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CityEntryBar(),
                    Spacer(),
                    TempCity(
                      weatherModel: weatherData,
                    ),
                    Spacer(),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                      child: Divider(
                        color: Colors.white70,
                        thickness: 1.5,
                      ),
                    ),
                    Spacer(),
                    AddWeatherInfo(
                      weatherModel: weatherData,
                    ),
                  ],
                ),
              ),
            ),
          );
        case WeatherState.isLoading:
          return CircularProgressIndicator();
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
