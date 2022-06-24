import 'package:advanced_ui/resources/widgets/button_item.dart';
import 'package:advanced_ui/resources/widgets/description.dart';
import 'package:advanced_ui/resources/widgets/image_cover.dart';
import 'package:advanced_ui/resources/widgets/title_widget.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // khối 1: Image
            ImageCover(assetImageLink: "assets/images/lake.jpeg"),
            // Khối 2: Title
            TitleWidget(
                title: "Oeschinen Lake Campground ",
                address: "Kandersteg Switzerland",
                rate: 41),
            // Khối 3: Buttons
            Container(
              padding: const EdgeInsets.only(top: 40, bottom: 40),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ButtonItem(
                        onPressed: (){
                          print("Calling");
                        },
                        iconData: Icons.call,
                        buttonColor: Colors.blue,
                        textButton: "Call"),),
                  Expanded(
                    flex: 1,
                    child: ButtonItem(
                        onPressed: (){
                          print("routing");
                        },
                        iconData: Icons.navigation,
                        buttonColor: Colors.blue,
                        textButton: "Route"),),
                  Expanded(
                    flex: 1,
                    child: ButtonItem(
                        onPressed: (){
                          print("sharing ...");
                        },
                        iconData: Icons.share,
                        buttonColor: Colors.blue,
                        textButton: "Share"),),

                ],
              ),
            ),
            Description(text: "Kandersteg, in the Bernese Highlands, is a dramatic resort village, facing the amazing Bluemlisalp Massif. This wonderful mountain village in the heart of Swiss Alps is a destination worth visiting throughout the calendar year. No doubt, its picture-perfect mountains and wooden chalets seem to cast a spell on you. But, it is considered a true paradise for skiers and hikers from all over the world.")

            // Khối 4: Description
          ],
        ),
      ),
    );
  }
}
