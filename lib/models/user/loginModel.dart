import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  UserData(firstName, lastName, email, phoneNumber, profilePic, nationName) {
    FirstName = firstName;
    LastName = lastName;
    Email = email;
    PhoneNumber = phoneNumber;
    ProfilePic = profilePic;
    NationalityName = nationName;
  }

  UserData.fromJson(Map<String, dynamic> json) {
    FirstName = json['FirstName'];
    LastName = json['LastName'];
    Email = json['Email'];
    PhoneNumber = json['PhoneNumber'];
    ProfilePic = json['ProfilePic'];
    NationalityName = json['NationalityName'];
  }

  Map<String, dynamic> toJson() => {
    "FirstName": FirstName,
    "LastName": LastName,
    "Email": Email,
    "PhoneNumber": PhoneNumber,
    "ProfilePic": ProfilePic,
    "NationalityName": NationalityName
  };
}

class UserRegister extends UserData{
  String  password;
  String  confirmPassword;
  UserRegister(firstName, lastName, email, phoneNumber, profilePic, nationName,password,confirmPassword) :
        super(firstName, lastName, email, phoneNumber, profilePic, nationName){

    this.password=password;
    this.confirmPassword=confirmPassword;


  }

  Map<String, dynamic> toJson() => {
    "FirstName": FirstName,
    "LastName": LastName,
    "Email": Email,
    "PhoneNumber": PhoneNumber,
    "ProfilePic": ProfilePic,
    "NationalityName": NationalityName,
    "Password": password,
    "ConfirmPassword":confirmPassword
  };
}