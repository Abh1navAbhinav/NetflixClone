import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/background_image_btn.dart';
import 'package:netflix/presentation/home/widgets/number_title_card.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

ValueNotifier scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (BuildContext context, index, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: const [
                      BackgroundImgBtnHome(),
                      MainTitleCard(
                        title: 'Released in the Past Year',
                      ),
                      MainTitleCard(
                        title: 'Trending Now',
                      ),
                      NumberTitleCard(),
                      MainTitleCard(
                        title: 'Tense Dramas',
                      ),
                      MainTitleCard(
                        title: 'South Indian Cinema',
                      ),
                    ],
                  ),
                  scrollNotifier.value
                      ? AnimatedContainer(
                          duration: const Duration(
                            milliseconds: 2500,
                          ),
                          color: kBlack.withOpacity(0.3),
                          width: double.infinity,
                          height: 100,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Image(
                                    image: NetworkImage(
                                      "https://flyclipart.com/thumb2/netflix-logo-png-transparent-image-png-arts-82874.png",
                                    ),
                                    height: 60,
                                    width: 70,
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.cast,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  kWidth,
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: Colors.blue,
                                  ),
                                  kWidth,
                                ],
                              ),
                              kHeight20,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Tv Shows',
                                    style: kHomeTitleTextStyle,
                                  ),
                                  Text(
                                    'Movies',
                                    style: kHomeTitleTextStyle,
                                  ),
                                  Text(
                                    'Categories',
                                    style: kHomeTitleTextStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
