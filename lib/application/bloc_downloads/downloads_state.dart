part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState({
    required bool isLoading,
    required Option<Either<MainFailures, List<Downloads>>>
        downloadsFailureOrSuccessOption,
  required  List<Downloads> downloads,
  }) = _DownloadsState;

  factory DownloadsState.initial() {
    return const DownloadsState(
      isLoading: false,
      downloadsFailureOrSuccessOption: None(),
      downloads: [],
    );
  }
}
