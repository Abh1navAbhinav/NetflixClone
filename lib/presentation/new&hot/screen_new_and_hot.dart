import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/new&hot/widgets/coming_soon_widget.dart';
import 'package:netflix/presentation/new&hot/widgets/every_ones_watching_widget.dart';

import '../../application/bloc_hot_and_new/hot_and_new_bloc.dart';

class NewAndHot extends StatelessWidget {
  const NewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'New & Hot',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            const Icon(
              Icons.cast,
              size: 30,
              color: Colors.white,
            ),
            kWidth,
            Container(
              height: 5,
              width: 30,
              color: Colors.blue,
            ),
            kWidth,
          ],
          bottom: TabBar(
            isScrollable: true,
            labelColor: kBlack,
            unselectedLabelColor: kWhite,
            labelStyle: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            indicator: BoxDecoration(
              color: kWhite,
              borderRadius: kRadius20,
            ),
            tabs: const [
              Tab(
                text: '🍿 Comming Soon',
              ),
              Tab(
                text: '👀 Every One\'s Watching',
              ),
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: TabBarView(
            children: [
              ComingSoonList(key: Key('coming_soon')),
              EveryoneIsWatchingList(key: Key("every_one_is_watching")),
            ],
          ),
        ),
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
                child: Text('error while loading coming soon list'));
          } else if (state.comingSoonList.isEmpty) {
            return const Center(child: Text('coming soon list is empty'));
          } else {
            return ListView.builder(
              itemCount: state.comingSoonList.length,
              itemBuilder: (context, index) {
                final movie = state.comingSoonList[index];
                final date = DateTime.parse(movie.releaseDate!);
                final formatedDate = DateFormat.yMMMMd('en_US').format(date);
                return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: formatedDate.split(' ').first.substring(0, 3),
                  year: formatedDate.split(' ').last,
                  day: movie.releaseDate!.split('-')[1],
                  posterPath: '$imageAppendUrl${movie.posterPath}',
                  movieName: movie.originalTitle ?? 'No title',
                  description: movie.overview ?? "No description",
                );
              },
            );
          }
        },
      ),
    );
  }
}

class EveryoneIsWatchingList extends StatelessWidget {
  const EveryoneIsWatchingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryOneIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryOneIsWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
                child: Text('error while loading coming soon list'));
          } else if (state.everyoneIsWatchingList.isEmpty) {
            return const Center(
                child: Text('Every one\'s watching list is empty'));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: state.everyoneIsWatchingList.length,
              itemBuilder: (context, index) {
                final tv = state.everyoneIsWatchingList[index];

                return EveryOnesWatchingWidget(
                  posterPath: '$imageAppendUrl${tv.posterPath}',
                  movieName: tv.originalName ?? 'No title',
                  description: tv.overview ?? "No description",
                );
              },
            );
          }
        },
      ),
    );
  }
}
