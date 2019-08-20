import 'package:flutter/material.dart';
import 'ui/movies_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        body: MoviesList(),
      ),
    );
  }
}
