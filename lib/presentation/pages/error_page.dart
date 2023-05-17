import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String err;
  ErrorPage({required this.err});

  _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Column(
            children: [
              Image.asset('images/city.png'),
              const SizedBox(
                height: 20,
              ),
              Text(err)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // return Stack(
    //   children: _showErrorDialog(context),
    // );
    return Stack(
      children: [_showErrorDialog(context)],
      // children: [
      //   AlertDialog(
      //     title: Text('Error'),
      //     content: Column(
      //       children: [
      //         Image.asset('images/city.png'),
      //         const SizedBox(
      //           height: 20,
      //         ),
      //         Text(err)
      //       ],
      //     ),
      //     actions: [
      //       TextButton(
      //         onPressed: () {
      //           Navigator.pop(context); // Close the dialog
      //         },
      //         child: Text('OK'),
      //       ),
      //     ],
      //   )
      // ],
    );
  }
}
