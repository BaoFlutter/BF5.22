import 'package:oop_dartdartt/hinh/hinh_vuong.dart';
import 'package:oop_dartdartt/oop_dartdartt.dart' as oop_dartdartt;
import 'package:oop_dartdartt/xe_tai.dart';

import 'user.dart';

void main(List<String> arguments) {
  // Tạo 1 đối tượng ( tạo 1 instance )
  User viet = User(name: "Nguyễn Việt", address: "Hà Nội", birthYear: 1998);
  User nam = User(name: "Le Nam", address: "Hà Nội", birthYear: 1997);
  User hoa = User(name: "Nguyễn Hoa", address: "Hà Nội", birthYear: 1991);
  User binh = User(name: "Ngo Binh", address: "Hà Nội", birthYear: 1999);
  int number = 10 ;
  hoa.setPhoneNumber(phoneNumber: "0349582808");
  print(hoa.getPhoneNumber());


  List<User> userList = [viet, nam, hoa, binh];
  print(viet.name);
  print("Tuổi của ${nam.name} là: ${nam.getAge()}");
  User maxAgeUser = findOldestUser(userList: userList);
  print("${maxAgeUser.name} có tuổi lớn nhất là : ${maxAgeUser.getAge()}");

  // 
  XeTai xeTai = XeTai(brand: "Huyndai", productionYear: 1989);
  

  print("Tuổi của xe là : ${xeTai.getAge()}");
  xeTai.chuyenCho();

  HinhVuong hinhVuong1 = HinhVuong(canh: 10);
  hinhVuong1.tinhChuVi();
 
}

User findOldestUser({required List<User> userList }){

  int maxAge= 0; 
  User? oldestUser;
  for(User user in userList)
  {
    int ageOfUser = user.getAge();
    if(ageOfUser >= maxAge) {
      maxAge = ageOfUser;
      oldestUser = user;
    }
  }
  return oldestUser!; 
}
