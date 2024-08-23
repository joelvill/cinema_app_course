import 'package:cinema_app_course/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLoading = false;
  bool isLastPage = false;

  @override
  void initState() {
    // ref.read(favotireMoviesProvider.notifier).loadNextPage();
    loadNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favotireMovies = ref.watch(favotireMoviesProvider).values.toList();

    if (favotireMovies.isEmpty) {
      final colors = Theme.of(context).colorScheme;
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.favorite_outline_sharp, size: 60, color: colors.primary),
          Text(
            "No movies in favorites",
            style: TextStyle(fontSize: 25, color: colors.primary),
          ),
        ],
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites View"),
      ),
      body: MovieMasonry(movies: favotireMovies, loadNextPage: loadNextPage),
    );
  }

  Future<void> loadNextPage() async {
    if (isLoading || isLastPage) return;

    isLoading = true;

    final movies =
        await ref.read(favotireMoviesProvider.notifier).loadNextPage();
    isLoading = false;

    if (movies.isEmpty) {
      isLastPage = true;
    }
  }
}
