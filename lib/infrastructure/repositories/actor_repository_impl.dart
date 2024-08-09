import '../../dominio/datasources/actor_datasource.dart';
import '../../dominio/entities/actor.dart';
import '../../dominio/repositories/actor_repositories.dart';

class ActorRepositoryImpl extends ActorRepository {
  final ActorDataSource datasoruce;

  ActorRepositoryImpl(this.datasoruce);

  @override
  Future<List<Actor>> getActorsByMovieId(String movieId) {
    return datasoruce.getActorsByMovieId(movieId);
  }
}
