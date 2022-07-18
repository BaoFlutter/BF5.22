import 'package:flutter/material.dart';
import 'package:movie_api_app/data_sources/api_services.dart';

import '../model/movie.dart';

class MoviesProvider extends ChangeNotifier {

  // dữ liệu cần lưu
  List<Movie> movieList = [];

  //  update Movies

  getMovieList() async {
    this.movieList = await ApiServices().fetchMovieList();
    notifyListeners();
  }

}