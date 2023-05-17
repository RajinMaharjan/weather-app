import 'package:flutter/material.dart';

class CustomIconTextWidget extends StatelessWidget {
  final IconData icon;
  final String val;
  final String name;

  const CustomIconTextWidget({
    Key? key,
    required this.icon,
    required this.val,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white70,
            size: 40,
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                val,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
