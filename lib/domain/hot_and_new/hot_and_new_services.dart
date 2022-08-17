

import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';

import 'model/hot_and_new.dart';

abstract class HotAndNewServices{
  Future<Either<MainFailures,HotAndNew>> getHotAndNewMovieData();
  Future<Either<MainFailures,HotAndNew>> getHotAndNewTvData();
}