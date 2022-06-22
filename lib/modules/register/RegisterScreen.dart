import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napta/models/user/loginModel.dart';
import 'package:napta/modules/login/LoginScreen.dart';
import 'package:napta/shared/cubit/cubit.dart';
import 'package:napta/shared/cubit/states.dart';
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

var firstNameController = TextEditingController();
var lastNameController = TextEditingController();
var phoneController = TextEditingController();
var emailController = TextEditingController();
var passwordController = TextEditingController();
var confirmPasswordController = TextEditingController();

class RegisterScreen extends StatelessWidget {
  String selectedValue;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, AppStates state) {},
        builder: (context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
              body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset("assets/images/backgtound.png").image,
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 550,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        border: Border.all(color: Colors.green[900], width: 1.5),
                        borderRadius: BorderRadius.circular(40), //Card
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(6, 1, 6, 6),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment:MainAxisAlignment.center,
                              children: [
                                Text("Registration",
                                  style: TextStyle(
                                    letterSpacing:1.5,
                                      fontSize: 25
                                      ,fontWeight:FontWeight.bold,
                                    color:Colors.blueGrey[800]
                                  ),),
                              ],
                            ),
                            SizedBox(height: 30,),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 160.0,
                                      height: 35.0,
                                      child: TextFormField(
                                        controller: firstNameController,
                                        keyboardType:
                                        TextInputType.emailAddress,
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
                                                BorderRadius.circular(
                                                    25.0)),
                                            fillColor: Colors.black,
                                            prefixIcon: Icon(
                                              Icons.person,
                                              //color: Colors.black,
                                            )),
                                        cursorColor: Colors.black,
                                      )),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Container(
                                      width: 160.0,
                                      height: 35.0,
                                      child: TextFormField(
                                        keyboardType:
                                        TextInputType.emailAddress,
                                        controller: lastNameController,
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
                                                BorderRadius.circular(
                                                    25.0)),
                                            fillColor: Colors.black,
                                            prefixIcon: Icon(Icons.person)),
                                        cursorColor: Colors.black,
                                      )),
                                ]),
                            SizedBox(
                              height: 15.0,
                            ),
                            Container(
                                width: double.infinity,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          width: 330.0,
                                          height: 35.0,
                                          child: TextFormField(
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            controller: emailController,
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
                                                        BorderRadius.circular(
                                                            25.0)),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          width: 330.0,
                                          height: 35.0,
                                          child: TextFormField(
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            controller: phoneController,
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
                                                        BorderRadius.circular(
                                                            25.0)),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Container(
                                          width: 330.0,
                                          height: 35.0,
                                          child: TextFormField(
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            controller: passwordController,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              labelText: "Password",
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
                                              fillColor: Colors.white,
                                              prefixIcon: Icon(Icons.lock),
                                              suffixIcon:
                                                  Icon(Icons.remove_red_eye),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Container(
                                          width: 330.0,
                                          height: 35.0,
                                          child: TextFormField(
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            controller: confirmPasswordController,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              labelText: "Confirm Password",
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DropdownButton(
                                    dropdownColor: Colors.white,
                                    hint: Text(
                                      "Select Nationality",
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          color: Colors.blue[700],fontSize: 16),
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
                                      // setState(() {
                                      selectedValue =
                                          cubit.SelectNationality(newValue);
                                      // });
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                                width: 430.0,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Container(
                                          width: 200.0,
                                          height: 40.0,
                                          child: MaterialButton(
                                            onPressed: () {
                                              UserRegister userDate = UserRegister(
                                                firstNameController.text.trim(),
                                                lastNameController.text.trim(),
                                                emailController.text.trim(),
                                                phoneController.text.trim(),
                                                " ",
                                                selectedValue.trim(),
                                                passwordController.text.trim(),
                                                confirmPasswordController.text
                                                    .trim(),
                                              );

                                              Map<String, dynamic> data =
                                                  userDate.toJson();
                                              print('USER UPDATED DATA IS : $data');
                                              cubit.postUser(User: data);

                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginScreen()),
                                              );
                                            },
                                            color: Colors.green[900],
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Text("CREATE AN ACCOUNT",
                                                style:
                                                    TextStyle(color: Colors.white,
                                                    letterSpacing:1,
                                                    wordSpacing: 2)),
                                          ))
                                    ])),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ));
        });
  }
}
