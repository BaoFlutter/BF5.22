
import 'package:flutter/material.dart';

import '../model/movie.dart';

class MovieListProvider with ChangeNotifier{

  // dữ liệu cần lưu
  List<Movie> movieList = [];

  //  update Movies

  updateMovieListProvider ({required List<Movie> movieList })
  {
    this.movieList = movieList;
    notifyListeners();
  }




}