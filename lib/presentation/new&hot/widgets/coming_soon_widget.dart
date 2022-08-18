import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/column_btn_home.dart';

import '../../widgets/video_widget_new_and_hot.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String year;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
     required this.year,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
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
            children: [
              Text(
                month,
                style: const TextStyle(
                  fontSize: 16,
                  color: kGrey,
                ),
              ),
              Text(
                day,
                style: const TextStyle(
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
          // height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidgetNewAndHot(image: posterPath),
              kHeight20,
              kHeight,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  kWidth20,
                  const ColumnButtonHome(
                    icon: Icons.notifications_outlined,
                    title: "Remind Me",
                    iconSize: 25,
                    fontSize: 10,
                    fontColor: kGrey,
                  ),
                  kWidth,
                  const ColumnButtonHome(
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
              Text(
                'Coming on $day $month $year' ,
              ),
              kHeight,
              Text(
                movieName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              Text(
                description,
                
                style: const TextStyle(
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
