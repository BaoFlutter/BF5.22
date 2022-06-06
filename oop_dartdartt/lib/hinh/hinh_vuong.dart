import 'package:oop_dartdartt/hinh/hinh_chu_nhat.dart';

class HinhVuong extends HinhChuNhat {
  HinhVuong({required double canh}): super(chieuDai: canh, chieuRong:canh);
  
  // ghi đè
  tinhChuVi(){
   print("Diện tích hình vuông là : ${super.tinhChuVi()}");
  }



}