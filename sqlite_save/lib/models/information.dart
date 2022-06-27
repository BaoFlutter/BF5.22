import 'package:state_lession/views/information_screen.dart';

class Information {
  int? id;
  double? average_mark;
  String? adjustment;


  Information({required this.id, required this.adjustment, required this.average_mark});

  Information.fromJson( Map json ):
        this.id = json['id'],
        this.average_mark = json['average_mark'],
        this.adjustment = json['adjustment'];

  toJson(){
    return {
      'id': this.id,
      'average_mark': this.average_mark,
      'adjustment': this.adjustment
    };
  }





}