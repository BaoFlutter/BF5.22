
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movie_api_app/model/movie.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
   
  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                height: 153,
                width: 113,
                decoration: BoxDecoration(           
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500${movie.poster_path}'),
                        fit: BoxFit.cover)),
              )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title!,
                      style: TextStyle(
                          fontFamily: "Comfortaa",
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: HexColor("#000000"),
                          fontStyle: FontStyle.normal),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    inForMovie('xuất bản:', movie.release_date!),
                    const SizedBox(
                      height: 15,
                    ),                  
                     inForMovie('bình chọn trung bình:', movie.vote_average.toString()),
                   
                    
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget inForMovie(String title, String description) {
    return Column( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontFamily: "Comfortaa",
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontStyle: FontStyle.normal),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontFamily: "Comfortaa",
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontStyle: FontStyle.normal),
        )
      ],
    );
  }
}
