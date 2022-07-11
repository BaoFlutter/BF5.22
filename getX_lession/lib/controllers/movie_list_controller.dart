import 'package:get/get.dart';

import '../model/movie.dart';

class MovieListController extends GetxController {
  // dữ liệu cần lưu
  List<Movie> movieList = [];

  //  update Movies

  updateMovieListController ({required List<Movie> movieList })
  {
    this.movieList = movieList;
    update();
  }

}