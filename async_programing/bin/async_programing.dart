import 'package:async_programing/async_programing.dart' as async_programing;

void main(List<String> arguments) async {
  /*
  var num = await makeSumLate(number1: 5, number2: 6);
  print("Số lấy về được là: ${num}");
  */
  // then :  Bất cứ dữ liệu dạng Future<T> đều có thể dùng then : ( dữ liệu dạng Future<T> ).then((value) {})
  makeSumLate(number1: 5, number2: 6).then((number) {
     print("Số lấy về được là: ${number}");
  });
  print("Chương trình kết thúc");

  // Test 1
  Stream<int> numberStream = makeNumberStream();
  //readStream1(numberStream: numberStream);
  Stream<int> numberStream2 = makeSecondStream(maxNumber: 5);
  //readStream1(numberStream: numberStream2);
  readStream2(numberStream: numberStream2);

}
// Dữ liệu dạng Future :  Future<int> 
// Future<T>  => T ; T =  await Future<T>;

 Future<int> makeSumLate({ required int number1, required int number2}){
  return Future.delayed(Duration(seconds: 2), (){
    return number1 + number2;
  });
}
// Stream : tức là dòng , (ống nước ) trong có chứa nhiễu dữ liệu dạng bất đồng bộ 
//*  Tạo ra Stream : 
// Cách 1: 
Stream<int> makeNumberStream(){
  return Stream<int>.periodic(Duration(seconds: 2), makeNumberUp);
}
int makeNumberUp(int value)=> value+ 1; 
// Cách 2 : yield - async*
Stream<int> makeSecondStream({required int maxNumber}) async* {
  for(int number = 1; number<= maxNumber; number++){
    yield number;
  }
}

// * Đọc dữ liệu từ Stream 

// Cách 1 
void readStream1({required Stream<int> numberStream})
{
  numberStream.listen((number){
    print(number);

});

}

// Cách 2 
void readStream2({required Stream<int> numberStream}) async
{
  await for(int number in numberStream ){
  print("Số lấy được từ Stream là : $number");
  }

}
// Future<int>, await async , then , Stream, yield - async* , listen 
