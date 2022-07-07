
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movie_api_app/model/movie.dart';

class OverView extends StatelessWidget {
   const OverView({ Key? key, required this.movie }) : super(key: key);
    final Movie movie;
   @override
   Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 25),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            const SizedBox(
              height: 20,
            ),
            Text('Overview',  style: TextStyle(
              fontFamily: "Comfortaa",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: HexColor("#000000"),
                      fontStyle: FontStyle.normal)),
            const SizedBox(
              height: 15,
            ),
             Text(movie.overview!,
             softWrap:  true,
             style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Comfortaa",
                      fontWeight: FontWeight.w400,
                      color: HexColor("#000000"),
                      fontStyle: FontStyle.normal)
             )
         ],
       ),
     );
   }
 }