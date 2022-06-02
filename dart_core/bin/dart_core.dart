

int toanCuc = 10; 
void main(List<String> arguments) {
  //print('Hello world: ${dart_core.calculate()}!');
  print("Hello World");
  int birthYear = 1991; 
  double point = 9.5;
  const double PI  = 3.1423422 ;
  const  pi = 3.14245; //  Dart khuyến cáo 
  birthYear = 1990; 
  // pi = 3.433; lỗi 
  
  final int year = birthYear;
  
  // year = 3000; lỗi 

  // Static ( tĩnh ) - Dynamic ( Động)
  
  // 1. Static : String , bool, int , double, List, Map, 
  String userName = "Báo Flutter";
  bool isLogined = true; 
  int number1 = 10 ; 
  int number2 = 20;
  int sum = number1 + number2;
  List<int> numberList = [1, 6, 7,3 ];
  Map<String, int> map = {
    "year": 2022, 
    "birth_year": 1991
  };

  // 2. Dynamic : var, dynamic - Có thể là bất kể kiểu dữ liệu tĩnh nào.
  var test10 = 10;  // chỉ đc lấy giá trị có kiểu dữ static ban đầu gán vào 
  test10 = 50; 
  //test10 = "Hello"; Lỗi
  var test20= "Flutter";
  var test30 = true; 
  dynamic test11 = 30;  // dynamic có thể nhận bất cú giá trị nào
   test11 = "hello";
  dynamic test12 = "Hello"; 
  

  int tong = tinhTong(10, 20, toanCuc);
  print("Giá trị biến tổng là: $tong");
  print("Giá trị biến tổng là: ${tinhTong(10, 20, toanCuc)}");
  print("Giá trị biến tổng là: " + "\n" + tong.toString());

  // Null Safety
  int? number5 ; // < 2.12,ngôn ngữ khác là null -- Hiện tại là không nhận null
  print(number5.toString());
  //number5 = 5;
  //int hieu = number5! - 2;
  int hieu = number5??0 - 2;
  print(hieu.toString());
  
 // int hieuHaiSo = tinhHieu(number2 , number1);
 int hieuHaiSo1 = tinhHieu(soBiTru: 20, soTru: 3);
 int hieuHaiSo2 = tinhHieu(soBiTru: 10, soTru: 5);

 // List 
 List<int> numberList1 = [ 3, 5, 6, 8, 9];
   // chỉ số phần tử:      0, 1,  2, 3, 4
   //         numberList1[0] = 3; numberList1[2] = 6; 
   // độ dài của list:      5 
   printOddNumbers(numberList: numberList1);

   printString();

   checkSoLe(number: 5);

   Map <String , dynamic > map1 = {
     "name" : "Báo Flutter", // key: value
     "age" : 31,
   };

   print (map1['age'].toString());


   print ("Lệnh cuối");
 

}
// 1. Tạo hàm : Tách biệt hoàn toàn với các hàm khác 
// 2. Sử dụng hàm: Có thể sử dụng bên trong các hàm khác 

// Biến cục bộ : Là biến chỉ dùng được trong hàm nào đó 
// Biến toàn cục : Được khai báo ở bên ngoài hàm và có thể sử dụng ở bất cứ hàm nào
tinhTong( int number1, int number2, int number3 ){
  return number1 + number2 + number3;
}
// Khi kiểu dữ liệu là dynamic thì mình có xoá dynamic , trình duyệt hiểu là dynamic

int tinhHieu( {  required int? soBiTru , required int? soTru })
{
   return soBiTru! - soTru!;
}

int tinhHieu2 ( {  required int? soBiTru , required int? soTru }) => soBiTru! - soTru!;

// => a; <=> { return a; }

// > . < , ||, && : true , false 
//  || tất cả giá trị đều là true trừ trường hơp cả 2 là false thì kq là false
//  && tất cả giá trị đều là false trừ trường hơp cả 2 là trưe thì kq là true

bool value1 = false ;
bool value2 = false ;
bool value3 = true ;
bool value6 = true ;
bool value4 =  value1|| value2 ; // false 
bool value5 =  value1|| value3 ; // true

bool value7 =  value1 && value3 ; // false 
bool value8 =  value6  &&  value3 ; // true




void printOddNumbers({required List<int> numberList}){
  // Cấu trúc vòng lặp, rẽ nhánh : chỉ dùng đc trong hàm 
/*
  // Duyệt theo chỉ số 
  for(int i = 0 ; i< numberList.length ; i++ )
  {
    // i++ <=> : i = i +1 ; <=> i+=1; 
    if( numberList[i]%2 !=0 ){
      print("Số lẻ là: ${numberList[i]}");
    }
    else continue; 

  }
  */

  /*
  // Duyệt theo phần tử dùng : for ... in '

  for (int number in numberList)
  {
    if(number %2 != 0 ) print("Số lẻ là: $number");
  }
  */

  /* // While
  int index = 0;
  while(index < numberList.length)
  {
    if( numberList[index]%2 !=0 ){
      print("Số lẻ là: ${numberList[index]}");
    }
    index ++;
   
  }
  */
  int index = 0; 
  do {
    if( numberList[index]%2 !=0 ){
      print("Số lẻ là: ${numberList[index]}");
    }
    index ++;

  }
  while(index < numberList.length);


}


// return , break , continue 

// return dùng khi tạo hàm : khi gặp return thì thoát hhàm 
// break : Vòng lặp , khi gặp break => thoát vòng lặp 
// continue : vòng lăp; khi gặp continue là : tiếp tục vòng lặp mới luôn;
int  printString(){
  print("In 1");
  print("In 2");
  for(int i = 1; i<= 10 ; i++) 
  {
    print(i.toString());
     if( i %2 == 0 ) continue;
    if( i %3 == 0 ) break; 
  }
  return 5; 
  print("In 3"); 
}

void checkSoLe({required int number })
{
  switch(number%2){
    case 1: 
    print("$number là số lẻ");
    break; 

    case 0: 
    print("$number là số chẵn");
    break; 

    default:
    print("Số không hợp lệ"); 
    break;  

  }


}



