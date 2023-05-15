import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/data/repository/weather_repository.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/presentation/pages/homePage.dart';

// final _cityProvider = ChangeNotifierProvider((ref) {
//   return CityProvider('Kathmandu');
// });

// class CityProvider extends ChangeNotifier {
//   String _cityName;
//   CityProvider(this._cityName);
//   String get cityName => _cityName;
//   set cityName(String name) {
//     _cityName = name;
//     notifyListeners();
//   }
// }

class CityEntryBar extends StatelessWidget {
  CityEntryBar({super.key});

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
                )),
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
            onTap: () {
              FocusScope.of(context).unfocus();
              final cityName = _cityEditController.text;
              WeatherService().getCurrentWeather(cityName: cityName);
            },
          )
        ],
      ),
    );
  }
}

// class CityEntryBar extends StatefulWidget {
//   const CityEntryBar({super.key});

//   @override
//   State<CityEntryBar> createState() => _CityEntryBarState();
// }

// class _CityEntryBarState extends State<CityEntryBar> {
//   final nameModel = Provider.of<NameModel>(context);
//   final TextEditingController _cityEditController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: SizedBox(
//               height: 50,
//               child: TextField(
//                 controller: _cityEditController,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(color: Colors.black),
//                 decoration: const InputDecoration(
//                   fillColor: Colors.white,
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(30),
//                         bottomLeft: Radius.circular(30)),
//                   ),
//                 ),
//                 onSubmitted: (value) => {},
//               ),
//             ),
//           ),
//           InkWell(
//             child: Container(
//               height: 50,
//               alignment: Alignment.center,
//               decoration: const BoxDecoration(
//                 color: AppColors.accentColor,
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(30),
//                   bottomRight: Radius.circular(30),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                 child: Text('search',
//                     style: Theme.of(context).textTheme.titleMedium),
//               ),
//             ),
//             onTap: (newName) {
//               nameModel.updateName(newName);
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
