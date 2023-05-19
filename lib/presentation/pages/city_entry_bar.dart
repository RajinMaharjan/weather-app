import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/presentation/provider/weather_provider.dart';

class CityEntryBar extends StatefulWidget {
  const CityEntryBar({super.key});

  @override
  State<CityEntryBar> createState() => _CityEntryBarState();
}

class _CityEntryBarState extends State<CityEntryBar> {
  final TextEditingController _cityEditController = TextEditingController();

  void showSnackBar(String title) {
    final snackbar = SnackBar(
      content: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextField(
                controller: _cityEditController,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            child: Container(
              height: 50,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.accentColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text('search',
                    style: Theme.of(context).textTheme.titleMedium),
              ),
            ),
            onTap: () async {
              //Add this code if you need to instantly check the connection .
              //for this internet_connection_checker package must be used
              // print("object");
              // final isConnected =
              //     await InternetConnectionChecker().hasConnection;
              // print("object2");

              // if (!isConnected) {
              //   print("This is $isConnected");
              //   showSnackBar("No internet connection.");
              // } else {
              FocusScope.of(context).unfocus();
              final cityName = _cityEditController.text;
              context
                  .read<WeatherProviderImpl>()
                  .getWeatherData(city: cityName);
              // }
            },
          )
        ],
      ),
    );
  }
}
