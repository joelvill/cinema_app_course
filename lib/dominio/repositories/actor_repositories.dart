import '../entities/actor.dart';

abstract class ActorRepository {
  Future<List<Actor>> getActorsByMovieId(String movieId);
}
