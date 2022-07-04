import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../models/video.dart';
import 'video_list_screen.dart';
class DetailVideoScreen extends StatefulWidget {
  final Video video;
  const DetailVideoScreen({Key? key, required this.video}) : super(key: key);

  @override
  State<DetailVideoScreen> createState() => _DetailVideoScreenState();
}

class _DetailVideoScreenState extends State<DetailVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.video.title!),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          /*
          var route = MaterialPageRoute(builder: (context)=> VideoListScreen());
          Navigator.pushAndRemoveUntil(context, route, (route) => false);
           */
          //Navigator.pop(context);
          Get.back() ; //Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: Column(
            children: [
              Image.network(widget.video.url_photo!),
              Html(data: widget.video.description!),
            ],
          ),
        ),

      ),
    );
  }
}
