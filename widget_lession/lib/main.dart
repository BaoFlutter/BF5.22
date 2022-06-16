import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String ageStr = "Chưa xác định";
  String nameStr = "Chưa xác định";

  TextEditingController userNameController = TextEditingController();
  TextEditingController birthYearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(right: 20, left: 20, top: 30),
            child: Column(
              children: [
                // TextField : Họ tên
                inputWidget(
                    lableText: "Họ và tên",
                    hintText: "Nhập họ và tên",
                    controller: userNameController),
                // Textfield : Năm sinh
                inputWidget(
                    lableText: "Năm sinh",
                    hintText: "Nhập năm sinh",
                    controller: birthYearController),

                // Button: Show information
                ElevatedButton(
                    onPressed: (){
                      setState((){
                        nameStr = userNameController.text;
                        ageStr = (DateTime.now().year - int.parse(birthYearController.text)).toString();

                      });
                    },
                    child: Text("Tính tuổi")),

                const SizedBox(height: 20,),

                // card of information
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    child: SizedBox(
                        width: 300,
                        height: 100,
                        child: Center(
                          child: Text(nameStr.toString() + " : " + ageStr.toString()),
                        )
                    ),
                  ),

                )
              ],
            )
        ),
      )
    );
  }

  // Tạo xong 1 Widget bằng hàm
  Widget inputWidget({ required String lableText, required String hintText, required controller }){
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: lableText,
          hintText: hintText
        ),
        controller: controller,
      )
    );

  }
}



