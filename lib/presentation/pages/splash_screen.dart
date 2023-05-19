import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/presentation/pages/decision_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DecisionPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.rainGradient,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImagePath.weather,
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Weather App",
                  style: TextStyle(fontSize: 24, color: Colors.white70),
                ),
              ],
            ),
          )),
    );
  }
}
