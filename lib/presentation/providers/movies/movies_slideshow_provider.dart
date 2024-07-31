import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../dominio/entities/movie.dart';
import 'movies_provider.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

  if (nowPlayingMovies.isEmpty) {
    return [];
  }

  return nowPlayingMovies.sublist(0, 6);
});
