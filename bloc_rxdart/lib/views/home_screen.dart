
import 'package:flutter/material.dart';
import 'package:movie_api_app/views/first_movie_list.dart';

import 'second_movie_list.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ElevatedButton(
                onPressed: (){
                  var route = MaterialPageRoute(builder: (context)=> FirstMovieList());
                  Navigator.push(context, route);
                },
                child: Text("Load First Movies")),
            ElevatedButton(
                onPressed: (){
                  var route = MaterialPageRoute(builder: (context)=> SecondMovieList());
                  Navigator.push(context, route);
                },
                child: Text("Show Movie List")),
          ],
        ),
      ),
    );
  }
}
