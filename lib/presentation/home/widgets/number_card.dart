import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class NumberCardHome extends StatelessWidget {
  final int index;
  final String imageUrl;
  const NumberCardHome({
    Key? key,
    required this.index,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              height: 250,
              width: 40,
            ),
            Container(
              width: 150,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: kRadius20,
                image:   DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    imageUrl,
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: -25,
          left: 5,
          child: BorderedText(
            strokeWidth: 5,
            strokeColor: kWhite,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                fontSize: 120,
                fontWeight: FontWeight.bold,
                color: kBlack,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
