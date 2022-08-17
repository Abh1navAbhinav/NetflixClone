import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/column_btn_home.dart';
import 'package:netflix/presentation/widgets/video_widget_new_and_hot.dart';

class EveryOnesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;
  
  const EveryOnesWatchingWidget({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const Text(
          'Friends',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          "This hits sitcon follows the merry misadventures of six 20-something pals as they navigate the pitfalls of work, life and love in 1990s Manhattan.",
          style: TextStyle(
            color: kGrey,
          ),
        ),
        kHeight50,
        const VideoWidgetNewAndHot(
          image:
              'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/6RT8SBh6AzonbLYnqjkvG4ovaVX.jpg',
        ),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            ColumnButtonHome(
              icon: Icons.share,
              title: 'Share',
              iconSize: 25,
              fontSize: 10,
              fontColor: kGrey,
            ),
            kWidth,
            ColumnButtonHome(
              icon: Icons.add,
              title: 'My List',
              iconSize: 25,
              fontSize: 10,
              fontColor: kGrey,
            ),
            kWidth,
            ColumnButtonHome(
              icon: Icons.play_arrow,
              title: 'Play',
              iconSize: 25,
              fontSize: 10,
              fontColor: kGrey,
            ),
            kWidth,
          ],
        ),
      ],
    );
  }
}
