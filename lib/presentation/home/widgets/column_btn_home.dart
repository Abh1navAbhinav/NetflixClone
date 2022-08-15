import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class ColumnButtonHome extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconSize;
  final double fontSize;
  final Color iconColor;
  final Color fontColor;
  const ColumnButtonHome({
    Key? key,
    required this.icon,
    required this.title,
    this.fontSize = 18,
    this.iconSize = 30,
    this.fontColor = kWhite,
    this.iconColor = kWhite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
            color: fontColor,
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
