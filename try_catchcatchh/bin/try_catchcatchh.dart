import 'dart:io';

import 'package:test/expect.dart';
import 'package:try_catchcatchh/try_catchcatchh.dart' as try_catchcatchh;

void main(List<String> arguments) {

  var input = "Flutter";
  /*
  try {
   int number = int.parse(input); 
  }

  // 1. Không để chương trình dừng đột ngột 
  // 2. có thể xử lý và in ra tất cả các exception 
 
  catch(e)
  {
    print(e.toString());
  }
  */
  /*
   try {
   int number = int.parse(input); 
  }
  on FormatException {
   print("Đây là lỗi format, vui lòng nhập lại");
  }
  on HttpException {
   print("Đây là lỗi http, vui lòng chờ đợi");
  }
  catch(e)
  {
    print(e.toString());
  }
  */
  try {
   int number = int.parse(input); 
  }
  catch(e)
  {
    print(e.toString());
  }
  finally{
    print("Bắt buộc phải chạy lệnh này");
  }
  print("Chương trình kết thúc");
  /*
  try {
    adjustAge(age: -5);
  }
  catch(e)
  {
    print(e.toString());
  }
  */
  adjustAge(age: 39);

  print ("Đánh giá tuổi kết thúc");

}

void adjustAge({ required int age }){
   if(age <= 0 ) throw Exception("AgeException: Tuổi luôn luôn phải lớn hơn 0. Vui lòng nhập lại");
   if(age < 45) print("Bạn vẫn còn trẻ");
   else print("Bạn đã có tuổi nên nghỉ ngơi");
}
