import 'package:flutter/material.dart';
import 'package:my_bloc_movies/src/models/item_model.dart';

class MovieDetail extends StatelessWidget {
  final AsyncSnapshot<ItemModel> snapshot;
  final int index;
  MovieDetail(this.snapshot, this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(snapshot.data.results[index].title),
      ),
      body: Container(
        child: Image.network(
            'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}'),
      ),
    );
  }
}
