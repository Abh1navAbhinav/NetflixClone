import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/fast_laugh/widgets/video_action_widget.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //left side

                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 30,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off_rounded,
                      color: kWhite,
                      size: 30,
                    ),
                  ),
                ),
                // right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          "https://www.themoviedb.org/t/p/w220_and_h330_face/zuNOQVI4rEaqwknrfQUVKtlKE2C.jpg",
                        ),
                      ),
                    ),
                    VideoActionWidget(
                      icon: Icons.emoji_emotions,
                      text: 'LoL',
                    ),
                    VideoActionWidget(
                      icon: Icons.add,
                      text: 'My List',
                    ),
                    VideoActionWidget(
                      icon: Icons.share,
                      text: 'Share',
                    ),
                    VideoActionWidget(
                      icon: Icons.play_arrow,
                      text: 'Play',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
