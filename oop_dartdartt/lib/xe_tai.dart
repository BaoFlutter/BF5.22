import 'xe.dart';

class XeTai extends Xe{
  
  //1. Khi kế thừa thì tất cả thuộc tính, phương thức của lớp cha thì lớp con đều có thể sử dụng
  //2.  Khi lớp cha có hàm khởi tạo thì lớp con cũng phải khởi tạo cho lớp cha 

 // XeTai({required super.brand, required super.productionYear});
 XeTai({ required  String brand, required int productionYear} ):super(brand: brand, productionYear: productionYear);
  //3. Biến Super ( cha) ; Khi tạo lớp con thì có thể lấy các thuộc tính, phương thức thông qua biến super

 int getAge(){
   return (DateTime.now().year - super.productionYear!);
 } 
 //4. Ghi đè phương thức

 @override
  void chuyenCho() {
    // TODO: implement chuyenCho
    super.chuyenCho();
    print("Xe chuyen cho vat lieu xay dung");
  }

  // extends , super , override 

  

}