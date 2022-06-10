class AppLoginModel {
  String access_token;
  String token_type = "bearer";

  AppLoginModel.fromJson(Map<String, dynamic> json) {
    access_token = json["access_token"];
  }
}

class UserData {
  String FirstName;
  String LastName;
  String Email;
  String PhoneNumber;
  String ProfilePic;
  String NationalityName;


  UserData.fromJson(Map<String, dynamic> json) {
    FirstName = json['FirstName'];
    LastName = json['LastName'];
    Email = json['Email'];
    PhoneNumber = json['PhoneNumber'];
    ProfilePic = json['ProfilePic'];
    NationalityName = json['NationalityName'];
  }
}
