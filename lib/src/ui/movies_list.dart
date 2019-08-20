import 'package:flutter/material.dart';
import 'package:my_bloc_movies/src/models/item_model.dart';
import 'package:my_bloc_movies/src/blocs/movies_bloc.dart';
import 'package:my_bloc_movies/src/ui/movie_detail.dart';

class MoviesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapShot) {
          if (snapShot.hasData) {
            return buildList(snapShot);
          } else if (snapShot.hasError) {
            return Text(snapShot.error.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data.results.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Ink.image(
          image: NetworkImage(
              'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}'),
          fit: BoxFit.cover,
          child: InkWell(
            child: null,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieDetail(snapshot, index)));
            },
          ),
        );
      },
    );
  }
}
