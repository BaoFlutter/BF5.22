import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movie_api_app/data_sources/api_services.dart';
import 'package:movie_api_app/model/cast.dart';

import 'cast_item.dart';

class CastWdiget extends StatefulWidget {
  const CastWdiget({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  _CastWdigetState createState() => _CastWdigetState();
}

class _CastWdigetState extends State<CastWdiget> {
  Future<List<Cast>>? futureCastList;
  @override
  void initState() {
    
    super.initState();
    loadCast();
  }

  loadCast() {
    futureCastList =
        // ignore: unnecessary_cast
        ApiServices().fetchCastList(widget.id) as Future<List<Cast>>?;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          Text(
            'Cast',
            style: TextStyle(
                fontFamily: "Comfortaa",
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: HexColor("#000000"),
                fontStyle: FontStyle.normal),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
              height: 160,
              child: FutureBuilder<List<Cast>>(
                  future: futureCastList,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Center(
                          child: Text('ERROR'),
                        );
                      case ConnectionState.waiting:
                        return const Center(child:  CircularProgressIndicator());
                      case ConnectionState.done:
                        List<Cast> castList = snapshot.data!;
                        return ListView.builder(                          
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: castList.length,
                            itemBuilder: (context, index) {
                              Cast cast = castList[index];
                              return CastItem(cast: cast);
                            });
                      default:
                        return Container();
                    }
                  }))
        ],
      ),
    );
  }
}
