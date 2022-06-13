class Plan{
   int WeekNum;
   List<FertQuntity> FertQuntities ;
   Plan.fromJson(Map<String, dynamic> json) {
      WeekNum = json['WeekNum'];
      List<dynamic> list = json['FertWithQuntities'];
      FertQuntities= list.map((e) => FertQuntity.fromJson(e)).toList();
   }
}
class FertQuntity{
   double Quantity;
   String FertilizerName;
   FertQuntity.fromJson(Map<String, dynamic> json) {
      Quantity = json['Quantity'];
      FertilizerName = json['FertilizerName'];
   }
}