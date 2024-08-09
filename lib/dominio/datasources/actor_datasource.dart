import '../entities/actor.dart';

abstract class ActorDataSource {
  Future<List<Actor>> getActorsByMovieId(String movieId);
}
