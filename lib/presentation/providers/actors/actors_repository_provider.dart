import 'package:cinema_app_course/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinema_app_course/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDBDataSource());
});
