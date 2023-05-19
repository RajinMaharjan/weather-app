import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/data/models/weather_model.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/presentation/pages/add_weather_info.dart';
import 'package:weather_app/presentation/pages/city_entry_bar.dart';
import 'package:weather_app/presentation/pages/temp_city.dart';
import 'package:weather_app/presentation/provider/weather_provider.dart';

class HomePage extends StatefulWidget {
  final String? err;
  final bool isTrue;
  final WeatherModel? weatherModel;
  final String? img;
  HomePage(
      {super.key, this.err, required this.isTrue, this.weatherModel, this.img});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _refreshData(String? city) async {
    WeatherProviderImpl weatherProvider =
        Provider.of<WeatherProviderImpl>(context, listen: false);

    await weatherProvider.getWeatherData(city: city!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () => _refreshData(widget.weatherModel!.name),
      child: SafeArea(
        child: SingleChildScrollView(
          child: (widget.isTrue)
              ? Container(
                  height: fullHeight(context),
                  width: fullWidth(context),
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
                        weatherModel: widget.weatherModel!,
                      ),
                      Spacer(),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Divider(
                          color: Colors.white70,
                          thickness: 1.5,
                        ),
                      ),
                      Spacer(),
                      AddWeatherInfo(
                        weatherModel: widget.weatherModel!,
                      ),
                    ],
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: AppColors.rainGradient,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CityEntryBar(),
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset(
                          widget.img!,
                          height: 150,
                          width: 150,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          '${widget.err}',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    ));
  }
}
