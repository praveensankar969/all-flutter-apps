import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:movie_app/models/movie.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> _moviesList = [];
  List<Movie> get movies => _moviesList;

  MovieProvider(BuildContext context) {
    setMoviesInContext(context);
  }

  Future<void> setMoviesInContext(BuildContext context) async {
    try {
      final jsonStr =
          await DefaultAssetBundle.of(context).loadString('assets/film.json');
      List<dynamic> parseJsonList = json.decode(jsonStr);
      _moviesList = parseJsonList
          .map(
            (el) => Movie.fromJson(el as Map<String, dynamic>),
          )
          .toList();
      notifyListeners();
    } catch (e) {
      //ignore error
    }
  }
}
