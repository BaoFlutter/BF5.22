import 'package:movie_api_app/data_sources/repository.dart';
import 'package:rxdart/rxdart.dart';

import '../model/movie.dart';

class MovieListBloc {
  final _repository = Repository();

  final movieListSubject = PublishSubject<List<Movie>>();
  // sink data into Bloc

putDataIntoBloc()async {
  List<Movie> movieList = await _repository.fetchMovieList();
  movieListSubject.sink.add(movieList);
}

Stream<List<Movie>> get movieListStream => movieListSubject.stream;

  dispose (){
    movieListSubject.close();
  }

}