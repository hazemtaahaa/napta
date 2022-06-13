
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napta/modules/login/LoginScreen.dart';
import 'package:napta/shared/cubit/cubit.dart';
import 'package:napta/shared/cubit/states.dart';

class ChangePassword extends StatelessWidget  {

  @override

  bool passwordVisible=false;

  bool newPasswordVisible=false;

  bool confirmPasswordVisible=false;
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var oldPasswordController = TextEditingController();
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, AppStates>(
        listener: (context, AppStates state) {
          if(state is PasswordChangedSuccessfully)
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      LoginScreen()),
            );

        },
    builder: (context, AppStates state) {
    AppCubit cubit = AppCubit.get(context);
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset("assets/images/backgtound.png").image,
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 700,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 600,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          border: Border.all(
                              color: Colors.green[600], width: 1.7),
                          borderRadius: BorderRadius.circular(40), //Card
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 180,
                              width: 180,
                              child: Stack(alignment: Alignment.center, children: [
                                //photo stack
                                CircleAvatar(
                                  radius: 80,
                                  backgroundImage: AssetImage(
                                      "assets/images/HazemTaha.jpeg"), //avtar if my img
                                ),

                                Container(
                                  height: 180,
                                  width: 180,
                                  child: Image(
                                    image: AssetImage("assets/images/Cover.png"),
                                  ),
                                ),
                              ]),
                            ), //السيركل افاتار
                            Text(
                            "${AppCubit.userData.FirstName} ${AppCubit.userData.LastName}" ,
                              style: TextStyle(
                                  color: Colors.green[900],
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none),
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            Container(
                              height: 70,
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                obscureText: !passwordVisible,
                                controller: oldPasswordController,
                                autofocus: false,
                                style: new TextStyle(
                                  fontSize: 20.0, ),
                                decoration: new InputDecoration(
                                  filled: true,
                                  prefixIcon:Icon(Icons.lock_outline),
                                  fillColor: Colors.white,
                                  labelText: 'Password',

                                  suffixIcon:IconButton(
                                    icon:Icon(
                                        passwordVisible?Icons.visibility:Icons.visibility_off
                                    ),
                                    onPressed: (){
                                      //setState(() {
                                        passwordVisible= cubit.changePasswordVisablity(passwordVisible);
                                      //});
                                    },
                                  ),


                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8.0, top: 8.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.white),
                                    borderRadius: new BorderRadius.circular(25.7),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.white),
                                    borderRadius: new BorderRadius.circular(25.7),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 70,
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: passwordController,
                                obscureText:!newPasswordVisible,
                                autofocus: false,
                                style: new TextStyle(
                                  fontSize: 20.0, ),
                                decoration: new InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon:Icon(Icons.lock_outline),
                                  labelText: 'New Password',
                                  suffixIcon:IconButton(
                                    icon:Icon(
                                        newPasswordVisible?Icons.visibility:Icons.visibility_off
                                    ),
                                    onPressed: (){
                                      //setState(() {
                                      newPasswordVisible= cubit.changePasswordVisablity(newPasswordVisible);


                                      //});
                                    },
                                  ),
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8.0, top: 8.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.white),
                                    borderRadius: new BorderRadius.circular(25.7),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.white),
                                    borderRadius: new BorderRadius.circular(25.7),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 70,
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: confirmPasswordController,
                                obscureText:!confirmPasswordVisible ,
                                autofocus: false,
                                style: new TextStyle(
                                  fontSize: 20.0, ),
                                decoration: new InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon:Icon(Icons.lock_outline),
                                  labelText: 'Confirm Password',
                                  suffixIcon:IconButton(
                                    icon:Icon(
                                        confirmPasswordVisible?Icons.visibility:Icons.visibility_off
                                    ),
                                    onPressed: (){
                                      //setState(() {
                                        confirmPasswordVisible= cubit.changePasswordVisablity(confirmPasswordVisible);
                                      //});
                                    },
                                  ),
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8.0, top: 8.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.white),
                                    borderRadius: new BorderRadius.circular(25.7),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.white),
                                    borderRadius: new BorderRadius.circular(25.7),
                                  ),
                                ),
                              ),
                            ),

                            Container(
                              width: 250,
                              height: 40,
                              child: FloatingActionButton.extended(
                                onPressed: () {
                                   cubit.changePassword(
                                       oldPassword:oldPasswordController.text,
                                       newpassword: passwordController.text,
                                       confirmPassword: confirmPasswordController.text);
                                   print('hhhhhhhhhhhh');
                                },
                                label: Text(
                                  "Change",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                backgroundColor: Colors.green[900],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));});
  }
}

