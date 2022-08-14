import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: const [
            MainTitleCard(
              title: 'Released in the Past Year',
            ),
            MainTitleCard(
              title: 'Trending Now',
            ),
            MainTitleCard(
              title: 'Tense Dramas',
            ),
            MainTitleCard(
              title: 'South Indian Cinema',
            ),
          ],
        ),
      ),
    );
  }
}
