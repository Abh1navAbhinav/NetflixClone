import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class Section1 extends StatelessWidget {
  const Section1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kWidth,
        Icon(
          Icons.settings,
          color: kWhite,
        ),
        kWidth,
        Text(
          'Smart Downloads',
        ),
      ],
    );
  }
}
