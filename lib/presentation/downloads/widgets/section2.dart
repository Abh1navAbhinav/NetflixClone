import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/downloads/widgets/downloads_image_widgets.dart';

import '../../../application/bloc_downloads/downloads_bloc.dart';

class Section2 extends StatelessWidget {
  const Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadBloc>(context).add(
        const DownloadEvent.getDownloadsImages(),
      );
    });
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
        BlocBuilder<DownloadBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(.5),
                            radius: size.width * 0.405,
                          ),
                        ),
                        DownloadsImageWidgets(
                          imageList:
                              "$imageAppendUrl${state.downloads[0].posterPath}",
                          margin: const EdgeInsets.only(
                              left: 170, bottom: 50, top: 10),
                          angle: 20,
                          size: Size(
                            size.width * 0.34,
                            size.width * 0.55,
                          ),
                        ),
                        DownloadsImageWidgets(
                          imageList:
                              "$imageAppendUrl${state.downloads[1].posterPath}",
                          margin: const EdgeInsets.only(
                              right: 170, bottom: 50, top: 10),
                          angle: -20,
                          size: Size(
                            size.width * 0.34,
                            size.width * 0.55,
                          ),
                        ),
                        DownloadsImageWidgets(
                          imageList:
                              "$imageAppendUrl${state.downloads[2].posterPath}",
                          margin: const EdgeInsets.only(top: 10),
                          size: Size(
                            size.width * 0.45,
                            size.width * 0.65,
                          ),
                        ),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}
