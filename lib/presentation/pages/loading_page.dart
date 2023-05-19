import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/presentation/pages/city_entry_bar.dart';
import 'package:weather_app/presentation/widgets/loading_indicator.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CityEntryBar(),
            SizedBox(
              height: fullHeight(context) * 0.2,
            ),
            const LoadingIndicator(),
          ],
        ),
      ),
    )));
  }
}
