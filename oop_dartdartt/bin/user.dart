// Đối tượng : User 
// 1. Thuộc tính : đặc điểm của đối tượng 
// 2. Hành vi đối tượng

class User {
// 1.Thuộc tính: các biến 
String? name;
String? address;  // public 
int? birthYear;  // public 
String? _phoneNumber;  // private : Chỉ sử dụng được trong class

//2. Phương thức: các hàm
//2.1 Hàm khởi tạo 
//User(); // Hàm khởi tạo mặc định
User({required this.name ,  this.address, required this.birthYear,} );

//2.2 : Hàm getter , setter 

// hàm getter 
String getPhoneNumber(){
  return this._phoneNumber!;
}
String get phoneNumber => this._phoneNumber!;

// hàm setter 
void setPhoneNumber({ required String phoneNumber}){
  this._phoneNumber = phoneNumber;
}

 int getAge(){
   return (DateTime.now().year - this.birthYear!);
 }

 void getInformation()
 {
   print("Họ và tên: ${this.name} \n Địa chỉ: ${this.address}" );
 }

 int _getAsset(){
   return 3000000000;
 }




}
