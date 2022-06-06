class HinhChuNhat{
  double? chieuDai; 
  double? chieuRong; 

  HinhChuNhat({ required this.chieuDai, required this.chieuRong});


  tinhChuVi(){
    return (this.chieuDai! + this.chieuRong!)*2; 
  }

  tinhDienTich(){
    return (this.chieuDai! * this.chieuRong!);
  }



}