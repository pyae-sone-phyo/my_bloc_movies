import 'dart:async';
import 'movie_api_provider.dart';
import 'package:my_bloc_movies/src/models/item_model.dart';

class Repository {
  final movieApiProvider = MovieApiProvider();
  Future<ItemModel> fetchAllMovies() => movieApiProvider.fetchMoviesList();
}
