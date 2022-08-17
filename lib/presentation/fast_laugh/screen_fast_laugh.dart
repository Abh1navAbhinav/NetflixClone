import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/bloc_fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/presentation/fast_laugh/widgets/video_list_item.dart';

class FastLaugh extends StatelessWidget {
  const FastLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(
        const Initialize(),
      );
    });
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastLaughBloc, FastLaughState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            } else if (state.isError) {
              return const Center(
                child: Text(
                  'error wile getting data',
                ),
              );
            } else if (state.videoList.isEmpty) {
              return const Center(
                child: Text(
                  'error wile getting data',
                ),
              );
            } else {
              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(
                  state.videoList.length,
                  (index) {
                    return VideoListItemInheritedWidget(
                      widget: VideoListItem(
                        index: index,
                        key: Key(
                          index.toString(),
                        ),
                      ),
                      movieData: state.videoList[index],
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
