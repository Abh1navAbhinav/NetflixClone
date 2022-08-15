import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/new&hot/widgets/coming_soon_widget.dart';

import 'widgets/every_ones_watching_widget.dart';

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
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TabBarView(
            children: [
              _buildCommingSoon(),
              _buildEveryOneWatching(),
            ],
          ),
        ),
      ),
    );
  }

  _buildCommingSoon() {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => const ComingSoonWidget());
  }

  _buildEveryOneWatching() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => const EveryOnesWatchingWidget(),
    );
  }
}
