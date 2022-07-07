import 'package:flutter/material.dart';
import 'package:movie_api_app/model/movie.dart';
import 'package:movie_api_app/widgets/cast_widget.dart';
import 'package:movie_api_app/widgets/header.dart';
import 'package:movie_api_app/widgets/over_view.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Colors.black,
            )),
        actions:[        
            Padding(
            padding:  EdgeInsets.only(right: 15),          
            child: Icon(
              Icons.favorite_border,
              size: 30,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/original${movie.backdrop_path}',
            fit: BoxFit.cover,
            height: size.height,
          ),
          Container(
            height: size.height,
            color: Colors.white.withOpacity(0.8),
          ),
          _body(context)
        ],
      ),
    );
  }

  _body(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        const SizedBox(
          height: 30,
        ),
        Header(
          movie: movie,
        ),
        const SizedBox(height: 15),
        CastWdiget(id: movie.id!),
        const SizedBox(height: 15),
        OverView(movie: movie)
      ],
    );
  }
}
