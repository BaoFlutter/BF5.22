
import 'package:flutter/material.dart';
import 'package:movie_api_app/data_sources/api_services.dart';
import 'package:movie_api_app/model/movie.dart';
import 'package:movie_api_app/providers/movie_list_provider.dart';
import 'package:movie_api_app/widgets/popular_item.dart';
import 'package:provider/provider.dart';

class PopularPage extends StatefulWidget {
  const PopularPage({Key? key}) : super(key: key);

  @override
  _PopularPageState createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
  Future<List<Movie>>? futureMovieList;

  @override
  void initState() {
   
    super.initState();
    loadMovie();
  }

  loadMovie() {
    futureMovieList = ApiServices().fetchMovieList();
  }

  @override
  Widget build(BuildContext context) {
    MovieListProvider movieListProvider = Provider.of<MovieListProvider>(context);
    //MovieListProvider movieListProvider = context.read<MovieListProvider>();

    return FutureBuilder<List<Movie>>(
        future: futureMovieList,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(
                child: Text('ERROR'),
              );
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              List<Movie> movieList = snapshot.data!;
              // 3. Lưu dữ liệu
              movieListProvider.updateMovieListProvider(movieList: movieList);
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.65,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20),
                  itemCount: movieList.length,
                  itemBuilder: (context, index) {
                    Movie movie = movieList[index];
                    return PopularItem(movie: movie);
                  });
            default:
              return Container();
          }
        });
  }
}
