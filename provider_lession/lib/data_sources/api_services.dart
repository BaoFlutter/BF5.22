
import 'package:http/http.dart' as http;
import 'package:movie_api_app/model/cast.dart';
import 'dart:convert';

import 'package:movie_api_app/model/movie.dart';
import 'package:movie_api_app/resources/utils/log.dart';

import 'api_url.dart';

class ApiServices {
  Future<List<Movie>> fetchMovieList() async {
    List<Movie> movieList = [];

    var movieUrl = ApiUrl.MOVIE_URL;
    var response;
    try {
      response = await http.get(movieUrl);
      var jsonBody = jsonDecode(response.body);
      //print(jsonBody);
      Log().printJson(json: jsonBody);
      if (jsonBody['page'] == 1) {
        var jsonList = jsonBody['results'];
        for (var json in jsonList) {
          Movie movie = Movie.fromJson(json);
          movieList.add(movie);
        }
         print("movieList:${movieList.length}");
      }
     
    } catch (e) {
      print('ERROR MOVIE LOADING: ' + e.toString());
    }

    return movieList;
  }

  Future<List<Cast>> fetchCastList(int? id) async {
    List<Cast> castList = [];
    final CAST_URL = Uri.parse(
        'https://api.themoviedb.org/3/movie/$id/credits?api_key=9bb89316d8693b06d7a84980b29c011f&language=vi-VN');
    print("CAST_URL:" + CAST_URL.toString());

    http.Response response;
    try {
      response = await http.get(CAST_URL);
      var jsonBody = jsonDecode(response.body);
      Log().printJson(json: jsonBody);
     // print(jsonBody);
      if (jsonBody['id'] == id) {
        var jsonCastList = jsonBody['cast'];
        for (var json in jsonCastList) {
          Cast cast = Cast.fromJson(json);
          castList.add(cast);
        }
        print(" castlist: ${castList.length}");
      }
    } catch (e) {
      print('ERROR MOVIE LOADING:' + e.toString());
    }

    return castList;
  }
}
