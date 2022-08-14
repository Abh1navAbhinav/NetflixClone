import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widgets.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({Key? key}) : super(key: key);

  final _widgetList = [
    const Section1(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(appBarText: 'DownLoads'),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder: (
            BuildContext context,
            int index,
          ) =>
              _widgetList[index],
          itemCount: _widgetList.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: 25,
          ),
        ));
  }
}

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

class DownloadsImageWidgets extends StatelessWidget {
  const DownloadsImageWidgets({
    Key? key,
    required this.imageList,
    required this.margin,
    required this.size,
    this.angle = 0,
    this.borderRadius = 10,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              imageList,
            ),
          ),
        ),
      ),
    );
  }
}

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

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Setup',
                style: TextStyle(
                  color: kWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: kButtonColorWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Se what you can download',
              style: TextStyle(
                color: kBlack,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
