import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weather_app/core/utils/constants.dart';

class CityEntryBar extends StatefulWidget {
  const CityEntryBar({super.key});

  @override
  State<CityEntryBar> createState() => _CityEntryBarState();
}

class _CityEntryBarState extends State<CityEntryBar> {
  final TextEditingController _cityEditController = TextEditingController();

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
                onSubmitted: (value) => {},
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
            onTap: () {},
          )
        ],
      ),
    );
  }
}
