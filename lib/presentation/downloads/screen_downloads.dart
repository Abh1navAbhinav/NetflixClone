import 'package:flutter/material.dart';
import 'package:netflix/presentation/downloads/widgets/section1.dart';
import 'package:netflix/presentation/downloads/widgets/section2.dart';
import 'package:netflix/presentation/downloads/widgets/section3.dart';
import 'package:netflix/presentation/widgets/app_bar_widgets.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({Key? key}) : super(key: key);

  final _widgetList = [
    const Section1(),
    const Section2(),
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
