import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

import 'column_btn_home.dart';

class BackgroundImgBtnHome extends StatelessWidget {
  const BackgroundImgBtnHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://www.themoviedb.org/t/p/w220_and_h330_face/hIkKM1nlzk8DThFT4vxgW1KoofL.jpg',
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const ColumnButtonHome(
                title: "My List",
                icon: Icons.add,
              ),
              _playButtonHome(),
              const ColumnButtonHome(
                title: "Info",
                icon: Icons.info_outline,
              ),
            ],
          ),
        )
      ],
    );
  }

  TextButton _playButtonHome() {
    return TextButton.icon(
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 35,
        color: kBlack,
      ),
      label: const Text(
        'Play',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: kBlack,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kWhite),
        padding: MaterialStateProperty.all(
          const EdgeInsets.only(right: 10),
        ),
      ),
    );
  }
}
