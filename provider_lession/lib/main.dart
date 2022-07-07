import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_api_app/providers/movie_list_provider.dart';
import 'package:movie_api_app/views/home_screen.dart';
import 'package:provider/provider.dart';

import 'views/first_movie_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 2. Khai báo Provider với Widget cha của các Widget con muốn sử dụng
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=> MovieListProvider())
        ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner:false,
        theme: ThemeData(
            fontFamily: "Comfortaa",
            visualDensity:  VisualDensity.adaptivePlatformDensity
        ),
        home: HomeScreen(),
      ),

    );
  }
}

