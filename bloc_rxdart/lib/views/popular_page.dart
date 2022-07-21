
import 'package:flutter/material.dart';
import 'package:movie_api_app/blocs/movie_list_bloc.dart';
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

  final MovieListBloc movieListBloc = MovieListBloc();

  @override
  void initState() {
    super.initState();
    movieListBloc.putDataIntoBloc();
  }


  @override
  Widget build(BuildContext context) {

    //MovieListProvider movieListProvider = context.read<MovieListProvider>();
    return StreamBuilder<List<Movie>>(
      stream: movieListBloc.movieListStream,
      builder: (context, snapshot){
        // Load lỗi
        if(snapshot.hasError) return Center(
          child: Text("Load Data Error "),
        );
        // chưa load xong
        if(!snapshot.hasData) return Center(
          child: CircularProgressIndicator(),
        );
        // Đã load xong
        List<Movie> movieList = snapshot.data!;
        // 3. Lưu dữ liệu


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

      },
    );
    /*
    return StreamBuilder<List<Movie>>(
        stream: movieListBloc.movieListStream,
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
              print("DATA LOADED: "+ movieList.toString());

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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    movieListBloc.dispose();
  }


}
