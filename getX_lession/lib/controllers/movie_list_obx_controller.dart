import 'package:get/get.dart';

import '../model/movie.dart';

class MovieListObxController extends GetxController {
  // static -> obs ; int a; => obs : a.obs;
  // obs -> static : var obsVar = obs_var.value

  // dữ liệu cần lưu
  var movieListObs  = [].obs; // obs

  //  update Movies

  updateMovieListController ({required List<Movie> movieList })
  {
    this.movieListObs = movieList.obs;
    update();
  }

}