import 'package:flutter/material.dart';
import 'package:state_lession/resources/widgets/input_widget.dart';
import 'package:state_lession/views/information.dart';

import '../resources/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  //1. Tạo ra State và tạo ra BuildContext ( context ) gắn với State
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //2. mounted = true ; - kiểm tra xem có tồn tại state hay chưa
  TextEditingController? mathController, englishController, litetureController;
  double? averagePoint;
  String? adjustmentResult = "Chưa xác định";
  // 3. Khởi động State, chưa dùng context , và có thể đặt các lệnh chạy trc khi build
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mathController = TextEditingController();
    englishController = TextEditingController();
    litetureController = TextEditingController();
  }

  // 4. chạy khi có Dependencies thay đổi : chạy khi widget chạy lần đầu và sau này có dependencies thay đổi
  // Context có thể đc dùng ở đây
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  // 5. Hàm Build

  @override
  Widget build(BuildContext context) {
    if (mounted) {
      print("State đã tồn tại !");
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(sudentAdjustment),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
              child: Column(
            children: [
              // TextField Toán
              InputWidget(
                  lableText: mathPoint,
                  hintText: mathHint,
                  controller: mathController),

              // TextField Văn
              InputWidget(
                  lableText: liteturePoint,
                  hintText: litetureHint,
                  controller: litetureController),

              // TextField Anh
              InputWidget(
                  lableText: englishPoint,
                  hintText: englishHint,
                  controller: englishController),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: (){
                    // 7 : setState
                    setState((){
                      averagePoint = (double.parse(mathController!.text) + double.parse(litetureController!.text) + double.parse(englishController!.text) )/3;
                      adjustmentResult = adjustmentStudent(averageMark: averagePoint!);
                    });

              }, child: Text(adjustment)),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: SizedBox(
                      width: 300,
                      height: 100,
                      child: Container(
                        padding: const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(averageMark + " : ${(averagePoint==null) ? "Chưa xác định" : averagePoint.toString()}" ),
                            const SizedBox(height: 10,),
                            Text(adjustment + " : " + adjustmentResult.toString())
                        ],
                        ),
                      )
                  ),
                ),

              ),

              TextButton(
                  onPressed: (){
                    var route = MaterialPageRoute(builder: (context) => Information(averagePoint: averagePoint!, adjustmentResult: adjustmentResult!));
                    Navigator.push(context, route);
                  },
                  child: Text(information)),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text("Button 1"),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text("Button 2"),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text("Button 3"),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Thông báo'),
                    content: const Text('Bạn có muốn thoát ứng dụng không ?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Huỷ'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('Đồng ý'),
                      ),
                    ],
                  ),
                ),
                child: const Text('Show Dialog'),
              )


            ],
          ),
        )));
  }
  // 6. Build UpdateWidget
  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  // 8. Deactivate : ngưng hoạt động State

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  // 9. dispose: Huỷ state
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mathController!.dispose();
    litetureController!.dispose();
    englishController!.dispose();
  }

  // 10: mounted = false



  String adjustmentStudent({required double averageMark})
  {
    if(averageMark < 5) return "Chưa đạt" ;
    if(averageMark < 8.5) return "Đạt";
    if(averageMark > 8.5) return "Xuất sắc";
    return "Không xác định";
  }





}
