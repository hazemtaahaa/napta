
class Diseas{
  String Name;
  String Description;
  String Treatment;
Diseas( String Name,
  String Description,
  String Treatment){
  this.Name=Name;
  this.Description=Description;
  this.Treatment=Treatment;
}

  Diseas.fromJson(Map<String, dynamic> json) {
    Name = json['Name'];
    Description = json['Description'];
    Treatment = json['Treatment'];
  }



}