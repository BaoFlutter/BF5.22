
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movie_api_app/model/movie.dart';
import 'package:movie_api_app/views/detail_screen.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final Movie movie;
   @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailScreen(movie: movie));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    Container(
                      height: 237,
                      width: 175,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.red,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${movie.poster_path}'),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                        right: 15,
                        bottom: 15,
                        child: Text(movie.release_date.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: HexColor("#FFFFFF"),
                                fontSize: 14,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700)))
                  ],
                )),
            Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Text(
                    movie.title!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Comfortaa",
                        color: HexColor("#000000"),
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
