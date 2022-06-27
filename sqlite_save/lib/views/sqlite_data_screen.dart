import 'package:flutter/material.dart';
import 'package:state_lession/databases/information_database.dart';

import '../models/information.dart';
import '../resources/strings.dart';

class SQliteDataScreen extends StatefulWidget {
  const SQliteDataScreen({Key? key}) : super(key: key);

  @override
  State<SQliteDataScreen> createState() => _SQliteDataScreenState();
}

class _SQliteDataScreenState extends State<SQliteDataScreen> {
  InformationDatabase informationDatabase = InformationDatabase();

  Future<List<Information>>? futureInformationList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInformationFromSQlite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(information),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder<List<Information>>(
            future: futureInformationList,
            builder: (context, snapshot){
              if(snapshot.hasError) return Center(
                child: Text("Load dữ liệu lỗi"),
              );
              if(!snapshot.hasData) return Center(
                child: CircularProgressIndicator(),
              );
              List<Information> informationList = snapshot.data!;
              return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: informationList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Information informationItem = informationList[index];
                    return Container(
                      height: 50,
                      child: Text("Điểm Trung Bình: ${informationItem.average_mark} , Đánh giá: ${informationItem.adjustment}")
                    );
                  }
              );


            },
          ),
        ));
  }

  getInformationFromSQlite() {
    futureInformationList = informationDatabase.fetchAll();
  }
}
