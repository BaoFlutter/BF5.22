import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

import '../resources/strings.dart';
class SharedPreferencedInformation extends StatefulWidget {
  const SharedPreferencedInformation({Key? key}) : super(key: key);

  @override
  State<SharedPreferencedInformation> createState() => _SharedPreferencedInformationState();
}

class _SharedPreferencedInformationState extends State<SharedPreferencedInformation> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<double>? futureAverageMark;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAverageMark = _prefs.then((SharedPreferences prefs) {
      return prefs.getDouble('average_mark') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(information),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
              child: FutureBuilder<double>(
                future: futureAverageMark,
                builder: (context, snapshot){
                  if(snapshot.hasError) return Center(
                    child: Text("Load dữ liệu lỗi"),
                  );
                  if(!snapshot.hasData) return Center(
                    child: CircularProgressIndicator(),
                  );
                  double averageMark = snapshot.data!;
                  return Container(
                    child: Card(
                      child: Center(
                        child: Text(averageMark.toString()),
                      ),
                    ),
                  );
                },
              ),

              // child: Container(
              //   width: MediaQuery.of(context).size.width,
              //   child: Card(
              //     child: SizedBox(
              //         width: 300,
              //         height: 100,
              //         child: Container(
              //           padding: const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(averageMark + " : ${(averagePoint==null) ? "Chưa xác định" : averagePoint.toString()}" ),
              //               const SizedBox(height: 10,),
              //               Text(adjustment + " : " + adjustmentResult.toString())
              //             ],
              //           ),
              //         )
              //     ),
              //   ),
              //
              // ),
            )
        )
    );
  }



}
