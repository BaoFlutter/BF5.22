import 'package:flutter/material.dart';
import 'popular_page.dart';

class FirstMovieList extends StatefulWidget {
  const FirstMovieList({Key? key}) : super(key: key);

  @override
  _FirstMovieListState createState() => _FirstMovieListState();
}

class _FirstMovieListState extends State<FirstMovieList>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
              decoration: const BoxDecoration(
                 gradient: LinearGradient(colors:  [Colors.blue, Colors.amber,Colors.purple],begin: Alignment.topLeft, end: Alignment.bottomRight)
              ),
        ),
        title: const Text('Movie', style: TextStyle(fontFamily: 'Comfortaa',fontSize: 24,color: Colors.black),)
      ),
      
      body: Column(
        children: [
          _tabBar(),
          const SizedBox(height: 15,),
          _tabBarView()
          ],
      ),
    );
  }

  _tabBar() {
    return Padding(
      padding: const EdgeInsets.only( top: 20,left: 15),
      child: TabBar(
        controller: _controller,
        labelStyle: const TextStyle(
            fontFamily: "Comfortaa", fontSize: 24, fontWeight: FontWeight.bold),
        tabs: const [
          Text("Popular"),
          Text(" NowPlaying"),
          Text("Up Coming"),
          Text('Top Rate')
        ],
        indicatorColor: Colors.black,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
        labelPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 2),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black.withOpacity(0.5),
        isScrollable: true,
      ),
    );
  }

  _tabBarView() {
    return Expanded(child: TabBarView(
      controller:  _controller,
       children: [
           const PopularPage(),
           Container(
              color: Colors.blue,
           ),
           Container(
              color: Colors.red,
           ),
           Container(
              color: Colors.orange,
           ),
       ],
    ));
  }

  

}
