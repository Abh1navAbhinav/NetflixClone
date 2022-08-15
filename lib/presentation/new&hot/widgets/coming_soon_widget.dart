import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/column_btn_home.dart';

import '../../widgets/video_widget_new_and_hot.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'FEB',
                style: TextStyle(
                  fontSize: 16,
                  color: kGrey,
                ),
              ),
              Text(
                '11',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 55,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VideoWidgetNewAndHot(),
              kHeight20,
              kHeight,
              Row(
                children: const [
                  Text(
                    'Tall girl 2',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  ColumnButtonHome(
                    icon: Icons.notifications_outlined,
                    title: "Remind Me",
                    iconSize: 25,
                    fontSize: 10,
                    fontColor: kGrey,
                  ),
                  kWidth,
                  ColumnButtonHome(
                    icon: Icons.info_outline,
                    title: "Info",
                    iconSize: 25,
                    fontSize: 10,
                    fontColor: kGrey,
                  ),
                  kWidth,
                ],
              ),
              kHeight,
              const Text(
                'Coming on friday',
              ),
              kHeight,
              const Text(
                'Tall Girl 2',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              const Text(
                "Landing the lead in the school musical is a dream come true for Jodi, untill the pressure sends her confidence - and her relationship - into a tailspin",
                style: TextStyle(
                  color: kGrey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
