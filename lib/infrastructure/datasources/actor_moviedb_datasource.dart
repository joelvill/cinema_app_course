import 'package:dio/dio.dart';

import '../../config/constants/environment.dart';
import '../../dominio/datasources/actor_datasource.dart';
import '../../dominio/entities/actor.dart';
import '../mappers/actor_mapper.dart';
import '../models/moviedb/credit_response.dart';

class ActorMovieDBDataSource extends ActorDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX',
      },
    ),
  );

  @override
  Future<List<Actor>> getActorsByMovieId(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    if (response.statusCode != 200) throw Exception('Error getting actors');

    final castResponse = CreditsResponse.fromJson(response.data);
    final List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();

    return actors;
  }
}
