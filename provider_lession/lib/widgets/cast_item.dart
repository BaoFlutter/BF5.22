
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movie_api_app/model/cast.dart';

class CastItem extends StatelessWidget {
  const CastItem({Key? key, required this.cast}) : super(key: key);
  final Cast cast;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),   
       width: 120,
      child: Column(
        children: [
          Container(
            height: 104,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),             
                image:  cast.profile_path==null?
                    const DecorationImage(image: AssetImage('assets/image/error_40px.png',), fit: BoxFit.cover)
               : DecorationImage(                      
                    image: NetworkImage('https://image.tmdb.org/t/p/w500/${cast.profile_path}'), fit: BoxFit.cover
                )),
          ),         
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(cast.name!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                       fontFamily: "Comfortaa",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: HexColor("#000000"),
                        fontStyle: FontStyle.normal)),
                Text(cast.character!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Comfortaa",
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: HexColor("#000000"),
                        fontStyle: FontStyle.normal)),
                      
              ],
            ),
          )
        ],
      ),
    );
  }
}
