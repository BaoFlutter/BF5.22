import 'package:movie_api_app/data_sources/api_services.dart';

import '../model/movie.dart';

class Repository {
  final ApiServices _apiServices = ApiServices();
  // Lấy dũ liệu từ data layer
  Future<List<Movie>> fetchMovieList() => _apiServices.fetchMovieList();


}