import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/downloads/widgets/downloads_image_widgets.dart';

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);

  final List imageList = [
    'https://www.themoviedb.org/t/p/w220_and_h330_face/stTEycfG9928HYGEISBFaG1ngjM.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/ggFHVNu6YYI5L9pCfOacjizRGt.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/zuNOQVI4rEaqwknrfQUVKtlKE2C.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kWhite,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          "We will download personalised selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        kHeight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(.5),
                  radius: size.width * 0.405,
                ),
              ),
              DownloadsImageWidgets(
                imageList: imageList[0],
                margin: const EdgeInsets.only(left: 170, bottom: 50, top: 10),
                angle: 20,
                size: Size(
                  size.width * 0.34,
                  size.width * 0.55,
                ),
              ),
              DownloadsImageWidgets(
                imageList: imageList[1],
                margin: const EdgeInsets.only(right: 170, bottom: 50, top: 10),
                angle: -20,
                size: Size(
                  size.width * 0.34,
                  size.width * 0.55,
                ),
              ),
              DownloadsImageWidgets(
                imageList: imageList[2],
                margin: const EdgeInsets.only(top: 10),
                size: Size(
                  size.width * 0.45,
                  size.width * 0.65,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
