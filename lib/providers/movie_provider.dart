

import 'package:flutter/material.dart';
import 'package:movie_app/modules/moview.dart';
import 'package:movie_app/utils/movie_parser.dart';

class MovieProvider extends ChangeNotifier {
  // This class can be expanded to manage movie data in the future.

  List<Movie> _movieList = [];
  
  List<Movie> get movieList => _movieList;


  Future<void> loadMoviews(BuildContext context)  async{
    try{

      final jsonString =await DefaultAssetBundle.of(context).loadString('assets/data/films.json');
      _movieList = MovieParser.parseMovies(jsonString);
      notifyListeners();
    } catch(e){
        print(e);
    }


  }




}