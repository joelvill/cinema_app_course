import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../dominio/entities/movie.dart';
import 'movies_repository_provider.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(moviesRepositoryProvider).getNowPlaying;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies,
  );
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({
    required this.fetchMoreMovies,
  }) : super([]);

  // method future void for load movie
  Future<void> loadNextPage() async {
    currentPage++;
    final movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
  }
}
