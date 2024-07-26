import 'package:cinema_app_course/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinema_app_course/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// This repository is inmutable
final moviesRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MovieDBDataSource());
});
