import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/modals/modal_downloads.dart';
import 'package:netflix/domain/search/model/search_response/search_resp/search_resp.dart';
import 'package:netflix/domain/search/search_services.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(
    this._downloadsService,
    this._searchService,
  ) : super(SearchState.initial()) {
    /* idle state */
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(state);
        return;
      }
      emit(
        const SearchState(
          searchResultList: [],
          idleList: [],
          isLoading: true,
          isError: false,
        ),
      );
      // get trending
      final result = await _downloadsService.getDownloadsImages();
      final states = result.fold(
        (MainFailures f) {
          return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        },
        (List<Downloads> list) {
          return SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(states);
      //show to ui
    });

    /* success state */
    on<SearchMovie>((event, emit) {
      //call search movie api

      _searchService.searchMovies(movieQuery: event.movieQuery);

      // show to ui
    });
  }
}
