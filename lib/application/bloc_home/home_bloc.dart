import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/hot_and_new/hot_and_new_services.dart';

import '../../domain/hot_and_new/model/hot_and_new.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewServices _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    /* 
    
    
    
    
     */
    on<GetHomeScreenData>((event, emit) async {
      // send loading to ui
      emit(state.copyWith(isLoading: true, hasError: false));

      // get data
      final movieResult = await _homeService.getHotAndNewMovieData();
      final tvResult = await _homeService.getHotAndNewTvData();

      //transform data
      final state1 = movieResult.fold(
        (failure) => HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramasMovieList: [],
          southIndianMovieList: [],
          trendingTvList: [],
          isLoading: false,
          hasError: true,
        ),
        (resp) {
          final pastYear = resp.results;
          pastYear.shuffle();
          final trending = resp.results;
          trending.shuffle();
          final tenseDrama = resp.results;
          tenseDrama.shuffle();
          final southIndian = resp.results;
          southIndian.shuffle();

          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: pastYear,
            trendingMovieList: trending,
            tenseDramasMovieList: tenseDrama,
            southIndianMovieList: southIndian,
            trendingTvList: state.trendingTvList,
            isLoading: false,
            hasError: false,
          );
        },
      );
      //send to ui

      emit(state1);

      final state2 = tvResult.fold(
        (failure) => HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramasMovieList: [],
          southIndianMovieList: [],
          trendingTvList: [],
          isLoading: false,
          hasError: true,
        ),
        (resp) {
          final top10List = resp.results;

          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: state.trendingMovieList,
            tenseDramasMovieList: state.tenseDramasMovieList,
            southIndianMovieList: state.southIndianMovieList,
            trendingTvList: top10List,
            isLoading: false,
            hasError: false,
          );
        },
      );
      //send to ui
      emit(state2);
    });
  }
}
