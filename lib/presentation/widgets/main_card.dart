
import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';


class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      child: Container(
        width: 150,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: kRadius20,
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://www.themoviedb.org/t/p/w220_and_h330_face/zuNOQVI4rEaqwknrfQUVKtlKE2C.jpg",
            ),
          ),
        ),
      ),
    );
  }
}
