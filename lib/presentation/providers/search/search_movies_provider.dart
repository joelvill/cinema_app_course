import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../dominio/entities/movie.dart';
import '../providers.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchMoviesProvider =
    StateNotifierProvider<SearchMoviesNotifier, List<Movie>>((ref) {
  final movieRepository = ref.read(moviesRepositoryProvider);

  return SearchMoviesNotifier(
    searchMovies: movieRepository.searchMovies,
    ref: ref,
  );
});

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMoviesNotifier extends StateNotifier<List<Movie>> {
  SearchMoviesCallback searchMovies;
  final Ref ref;

  SearchMoviesNotifier({required this.searchMovies, required this.ref})
      : super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = movies;
    return movies;
  }
}
