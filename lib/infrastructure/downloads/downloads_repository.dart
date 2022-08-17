
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/modals/modal_downloads.dart';

@LazySingleton(as: IDownloadRepo)
class DownloadsRepository implements IDownloadRepo {
  @override
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloadsUrl);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadsList = (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();

        return right(downloadsList);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailures.clientFailure());
    }
  }
}
