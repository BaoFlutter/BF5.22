import 'package:reactive_programing/reactive_programing.dart' as reactive_programing;
import 'package:rxdart/rxdart.dart';
void main(List<String> arguments) {
  //demoBehaviourSubject();
  //demoPublishSubject();
  demoReplaySubject();
  
}

// Lấy tất cả các dữ liệu thêm vào sau và lấy 1 giá trị thêm vào gần nhất trước đó
void demoBehaviourSubject(){
  // Tạo Subject <=> Tạo ra 1 Stream rỗng 
  BehaviorSubject subject = BehaviorSubject<int>();
  subject.listen((number) { 
    print("Lần lấy dữ liệu lần 1: $number");
  });
  subject.add(100); 
  subject.add(101); 
   subject.listen((number) { 
    print("Lần lấy dữ liệu lần 2: $number");
  });
  subject.add(200); 
  subject.add(201);
}

// Chỉ Lấy tất cả dữ liệu thêm vào sau thời điểm lắng nghe ,
void demoPublishSubject(){
  // Tạo Subject <=> Tạo ra 1 Stream rỗng 
  PublishSubject subject = PublishSubject<int>();
  subject.listen((number) { 
    print("Lần lấy dữ liệu lần 1: $number");
  });
  subject.add(100); 
  subject.add(101); 
   subject.listen((number) { 
    print("Lần lấy dữ liệu lần 2: $number");
  });
  subject.add(200); 
  subject.add(201);
}

// Có bao nhiêu trong Stream thì lấy hết
void demoReplaySubject(){
  // Tạo Subject <=> Tạo ra 1 Stream rỗng 
  ReplaySubject subject = ReplaySubject<int>();
  subject.listen((number) { 
    print("Lần lấy dữ liệu lần 1: $number");
  });
  subject.add(100); 
  subject.add(101); 
   subject.listen((number) { 
    print("Lần lấy dữ liệu lần 2: $number");
  });
  subject.add(200); 
  subject.add(201);
}