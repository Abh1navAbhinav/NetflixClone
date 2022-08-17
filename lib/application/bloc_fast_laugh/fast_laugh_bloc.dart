import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/modals/modal_downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
];

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadRepo _downloadsService,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      // sending loading to ui
      emit(
        const FastLaughState(
          videoList: [],
          isLoading: true,
          isError: false,
        ),
      );
      // get trending movies
      final result = await _downloadsService.getDownloadsImages();
      final state = result.fold(
        (l) {
          return const FastLaughState(
            videoList: [],
            isLoading: false,
            isError: true,
          );
        },
        (resp) => FastLaughState(
          videoList: resp,
          isLoading: false,
          isError: false,
        ),
      );
      // send to ui
      emit(state);
    });
  }
}
