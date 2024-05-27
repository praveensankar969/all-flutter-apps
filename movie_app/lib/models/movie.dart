import 'dart:convert';

class Movie {
  String title;
  String year;
  String rated;
  String released;
  String runtime;
  String genre;
  String director;
  String writer;
  String actors;
  String plot;
  String language;
  String country;
  String awards;
  String poster;
  String metascore;
  String imdbRating;
  String imdbVotes;
  String imdbId;
  String type;
  String response;
  List<String> images;

  Movie({
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.poster,
    required this.metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbId,
    required this.type,
    required this.response,
    required this.images,
  });

  factory Movie.fromMap(Map<String, dynamic> data) => Movie(
        title: data['Title'] as String,
        year: data['Year'] as String,
        rated: data['Rated'] as String,
        released: data['Released'] as String,
        runtime: data['Runtime'] as String,
        genre: data['Genre'] as String,
        director: data['Director'] as String,
        writer: data['Writer'] as String,
        actors: data['Actors'] as String,
        plot: data['Plot'] as String,
        language: data['Language'] as String,
        country: data['Country'] as String,
        awards: data['Awards'] as String,
        poster: data['Poster'] as String,
        metascore: data['Metascore'] as String,
        imdbRating: data['imdbRating'] as String,
        imdbVotes: data['imdbVotes'] as String,
        imdbId: data['imdbID'] as String,
        type: data['Type'] as String,
        response: data['Response'] as String,
        images: List<String>.from(data['Images'] as List),
      );

  Map<String, dynamic> toMap() => {
        'Title': title,
        'Year': year,
        'Rated': rated,
        'Released': released,
        'Runtime': runtime,
        'Genre': genre,
        'Director': director,
        'Writer': writer,
        'Actors': actors,
        'Plot': plot,
        'Language': language,
        'Country': country,
        'Awards': awards,
        'Poster': poster,
        'Metascore': metascore,
        'imdbRating': imdbRating,
        'imdbVotes': imdbVotes,
        'imdbID': imdbId,
        'Type': type,
        'Response': response,
        'Images': images,
      };

  factory Movie.fromJson(Map<String, dynamic> data) {
    return Movie.fromMap(data);
  }
}
