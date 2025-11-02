

import 'dart:convert';

import 'package:movie_app/modules/moview.dart';

class MovieParser {

  static List<Movie> parseMovies(String jsonString) {
    // Dummy implementation for parsing movies from JSON string
    List<dynamic> parsedJson = json.decode(jsonString);
    // In a real scenario, you would use a JSON parsing library
    return parsedJson.map((jsonItem) => Movie.fromJson(jsonItem as Map<String,dynamic>)).toList();
  }


  
}