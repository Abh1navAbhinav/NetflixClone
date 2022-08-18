import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/bloc_home/home_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/background_image_btn.dart';
import 'package:netflix/presentation/home/widgets/number_title_card.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

ValueNotifier scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
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
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        );
                      }
                      if (state.hasError) {
                        return const Center(
                          child: Text(
                            'Error while getting data',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                      /* released past year */
                      final releasesPastYear = state.pastYearMovieList
                          .map((e) => '$imageAppendUrl${e.posterPath}')
                          .toList();
                      // releasesPastYear.shuffle();
                      /* trending  */
                      final trendingList = state.trendingMovieList
                          .map((e) => '$imageAppendUrl${e.posterPath}')
                          .toList();
                      // trendingList.shuffle();
                      /*  tense dramas movie list */
                      final tensedramaList = state.tenseDramasMovieList
                          .map((e) => '$imageAppendUrl${e.posterPath}')
                          .toList();
                      // tensedramaList.shuffle();
                      /* south indian movie list  */
                      final southIndianList = state.southIndianMovieList
                          .map((e) => '$imageAppendUrl${e.posterPath}')
                          .toList();
                      // southIndianList.shuffle();
                      /* list view */
                      return ListView(
                        children: [
                          const BackgroundImgBtnHome(),
                          MainTitleCard(
                            title: 'Released in the Past Year',
                            posterList: releasesPastYear,
                          ),
                          MainTitleCard(
                            title: 'Trending Now',
                            posterList: trendingList,
                          ),
                          const NumberTitleCard(),
                          MainTitleCard(
                            title: 'Tense Dramas',
                            posterList: tensedramaList,
                          ),
                          MainTitleCard(
                            title: 'South Indian Cinema',
                            posterList: southIndianList,
                          ),
                        ],
                      );
                    },
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
