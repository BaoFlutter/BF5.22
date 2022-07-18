
import 'package:flutter/material.dart';
import 'package:movie_api_app/data_sources/api_services.dart';
import 'package:movie_api_app/model/movie.dart';
import 'package:movie_api_app/widgets/popular_item.dart';
import 'package:provider/provider.dart';

import '../providers/movie_list_provider.dart';

class SecondMovieList extends StatefulWidget {
  const SecondMovieList({Key? key}) : super(key: key);

  @override
  _SecondMovieListState createState() => _SecondMovieListState();
}

class _SecondMovieListState extends State<SecondMovieList> {
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
    //MovieListProvider movieListProvider = context.watch<MovieListProvider>();
    List<Movie> movieList  = movieListProvider.movieList;
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Second Screen"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.65,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20),
            itemCount: movieList.length,
            itemBuilder: (context, index) {
              Movie movie = movieList[index];
              return PopularItem(movie: movie);
            })
      ),
    );
    /*
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

     */
  }
}
