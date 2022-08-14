import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class ColumnButtonHome extends StatelessWidget {
  final IconData icon;
  final String title;
  const ColumnButtonHome({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhite,
          size: 30,
        ),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
