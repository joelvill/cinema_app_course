import '../../dominio/datasources/movies_datasources.dart';
import '../../dominio/entities/movie.dart';
import '../../dominio/repositories/movies_repositories.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return dataSource.getNowPlaying(page: page);
  }
}
