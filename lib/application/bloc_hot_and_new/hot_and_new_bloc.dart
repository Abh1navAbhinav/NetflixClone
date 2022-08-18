import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';
import 'package:netflix/domain/hot_and_new/hot_and_new_services.dart';
import 'package:netflix/domain/hot_and_new/model/hot_and_new.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewServices _hotAndNewServices;
  HotAndNewBloc(this._hotAndNewServices) : super(HotAndNewState.initial()) {
/* get hot and new movie data */
    on<LoadDataInComingSoon>((event, emit) async {
      // send loading to ui
      emit(
        const HotAndNewState(
          comingSoonList: [],
          everyoneIsWatchingList: [],
          isLoading: true,
          hasError: false,
        ),
      );
      // get data from remote
      final result = await _hotAndNewServices.getHotAndNewMovieData();

      // data to state
      final newState = result.fold(
        (MainFailures failures) {
          return const HotAndNewState(
            comingSoonList: [],
            everyoneIsWatchingList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (resp) {
          return HotAndNewState(
            comingSoonList: resp.results,
            everyoneIsWatchingList: state.everyoneIsWatchingList,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(newState);
    });

    on<LoadDataInEveryOneIsWatching>((event, emit) async {
      // send loading to ui
      emit(
        const HotAndNewState(
          comingSoonList: [],
          everyoneIsWatchingList: [],
          isLoading: true,
          hasError: false,
        ),
      );
      // get data from remote
      final result = await _hotAndNewServices.getHotAndNewTvData();

      // data to state
      final newState = result.fold(
        (MainFailures failures) {
          return const HotAndNewState(
            comingSoonList: [],
            everyoneIsWatchingList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (resp) {
          return HotAndNewState(
            comingSoonList: state.everyoneIsWatchingList,
            everyoneIsWatchingList: resp.results,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(newState);
    });
  }
}
