import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class VideoWidgetNewAndHot extends StatelessWidget {
  final String image;
  const VideoWidgetNewAndHot({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: kRadius5,
            image: DecorationImage(
              image: NetworkImage(
                image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            radius: 22,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off_rounded,
                color: kWhite,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
