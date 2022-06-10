import 'package:flutter/material.dart';
import 'package:napta/modules/login/LoginScreen.dart';
//import 'package:napta_final/Login/login_screen.dart';

String country_id;
List<String> country = [
  "egypt",
  "morAco",
  "America",
  "Brazil",
  "Canada",
  "India",
  "Mongalia",
  "USA",
  "China",
  "Russia",
  "Germany"
];

String f_name, l_name, E_Mail, phone, pass, confirm_pass;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/backgtound.png"),
                    fit: BoxFit.fill)),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 350.0,
                    ),
                    Container(
                        width: 430.0,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 15.0,
                              ),
                              Container(
                                  width: 160.0,
                                  height: 35.0,
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (value) {
                                      f_name = value;
                                      print("First Name: " + f_name);
                                    },
                                    decoration: InputDecoration(
                                        labelText: "First Name",
                                        labelStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontFamily: 'Lato'),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.green,
                                                width: 2.0),
                                            borderRadius:
                                            BorderRadius.circular(25.0)),
                                        fillColor: Colors.black,
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Colors.black,
                                        )),
                                    cursorColor: Colors.black,
                                  )),
                              SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                  width: 160.0,
                                  height: 35.0,
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (value) {
                                      l_name = value;
                                      print("Last Name: " + l_name);
                                    },
                                    decoration: InputDecoration(
                                        labelText: "Last Name",
                                        labelStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontFamily: 'Lato'),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.green,
                                                width: 2.0),
                                            borderRadius:
                                            BorderRadius.circular(25.0)),
                                        fillColor: Colors.black,
                                        prefixIcon: Icon(Icons.person)),
                                    cursorColor: Colors.black,
                                  )),
                            ])),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                        width: 430.0,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 15.0,
                              ),
                              Container(
                                  width: 330.0,
                                  height: 35.0,
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (value) {
                                      E_Mail = value;
                                      print("E Mail" + E_Mail);
                                    },
                                    decoration: InputDecoration(
                                        labelText: "E-Mail",
                                        labelStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontFamily: 'Lato'),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.green,
                                                width: 2.0),
                                            borderRadius:
                                            BorderRadius.circular(25.0)),
                                        fillColor: Colors.black,
                                        prefixIcon: Icon(Icons.mail)),
                                    cursorColor: Colors.black,
                                  )),
                            ])),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                        width: 430.0,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 15.0,
                              ),
                              Container(
                                  width: 330.0,
                                  height: 35.0,
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (value) {
                                      phone = value;
                                      print("phone: " + phone);
                                    },
                                    decoration: InputDecoration(
                                        labelText: "Phone",
                                        labelStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontFamily: 'Lato'),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.green,
                                                width: 2.0),
                                            borderRadius:
                                            BorderRadius.circular(25.0)),
                                        fillColor: Colors.black,
                                        prefixIcon: Icon(Icons.phone)),
                                    cursorColor: Colors.black,
                                  )),
                            ])),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                        width: 430.0,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 15.0,
                              ),
                              Container(
                                  width: 330.0,
                                  height: 35.0,
                                  child: TextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    onChanged: (value) {
                                      pass = value;
                                      print("Password: " + pass);
                                    },
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                      labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: 'Lato'),
                                      border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.green, width: 2.0),
                                          borderRadius:
                                          BorderRadius.circular(25.0)),
                                      fillColor: Colors.white,
                                      prefixIcon: Icon(Icons.lock),
                                      suffixIcon: Icon(Icons.remove_red_eye),
                                    ),
                                    cursorColor: Colors.black,
                                  )),
                            ])),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                        width: 430.0,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 15.0,
                              ),
                              Container(
                                  width: 330.0,
                                  height: 35.0,
                                  child: TextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    onChanged: (value) {
                                      confirm_pass = value;
                                      print(
                                          "Confirm Password: " + confirm_pass);
                                    },
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: "Confirm Password",
                                      labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: 'Lato'),
                                      border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.green, width: 2.0),
                                          borderRadius:
                                          BorderRadius.circular(25.0)),
                                      fillColor: Colors.white,
                                      prefixIcon: Icon(Icons.lock),
                                      suffixIcon: Icon(
                                        Icons.remove_red_eye,
                                      ),
                                    ),
                                    cursorColor: Colors.black,
                                  )),
                            ])),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                      child: DropdownButton(
                          dropdownColor: Colors.white,
                          hint: Text(
                            "Select Nationality",
                            style: TextStyle(
                                fontFamily: 'Lato', color: Colors.deepOrange),
                          ),
                          value: selectedValue,
                          items: country.map((item) {
                            return DropdownMenuItem(
                              child: Text(
                                item,
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                              value: item,
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedValue = newValue;
                            });
                          }),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        width: 430.0,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 22.0,
                              ),
                              Container(
                                  width: 320.0,
                                  height: 35.0,
                                  child: MaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                               LoginScreen()),
                                      );
                                    },
                                    color: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: Text("CREATE AN ACCOUNT",
                                        style: TextStyle(color: Colors.white)),
                                  ))
                            ])),
                  ]),
            )));
  }
}
