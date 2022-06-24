import 'package:flutter/material.dart';
class ImageCover extends StatelessWidget {
  final String assetImageLink;

  const ImageCover({Key? key, required this.assetImageLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(assetImageLink,
      height: MediaQuery.of(context).size.height/2.5,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }
}
