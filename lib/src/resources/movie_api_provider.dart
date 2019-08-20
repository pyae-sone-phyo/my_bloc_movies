import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:my_bloc_movies/src/models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = "4a7463c7e5184d2e84845a0456a9a219";

  Future<ItemModel> fetchMoviesList() async {
    final response = await client
        .get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    print(response.body);
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load movies");
    }
  }
}
