import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../dominio/entities/actor.dart';
import 'actors_repository_provider.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final getActorsByMovieId =
      ref.watch(actorsRepositoryProvider).getActorsByMovieId;

  return ActorsByMovieNotifier(getActorsByMovieId);
});

typedef GetActorsdCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsdCallback getActorsByMovieId;

  ActorsByMovieNotifier(this.getActorsByMovieId) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final actors = await getActorsByMovieId(movieId);
    state = {...state, movieId: actors};
  }
}
