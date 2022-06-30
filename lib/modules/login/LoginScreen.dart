import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:napta/models/plantsModel/PlantModel.dart';
import 'package:napta/modules/BottomNavigation/BottomNavigationScreen.dart';
import 'package:napta/modules/register/RegisterScreen.dart';
import 'package:napta/shared/cubit/cubit.dart';
import 'package:napta/shared/cubit/states.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();
var passwordVisible = true;

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, AppStates state) {
        print('current stat in listener: $state');
        AppCubit cubit = AppCubit.get(context);
        if (state is UserLoginFailed) {
          Fluttertoast.showToast(
              msg: "Wrong Username or Password" ,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 20.0
          );
          print("Wrong Username or Password");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
              (Route<dynamic> route) => false);
        } else if (state is UserLoginSuccess) {
          Fluttertoast.showToast(
              msg: "Login Successfully" ,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0
          );

          AppCubit.Token = UserLoginSuccess.token;
          cubit.getPosts();
        } else if (state is GetPostsSuccessfullyState) {
          AppCubit.Posts = GetPostsSuccessfullyState.posts;
          cubit.getUserData();
        } else if (state is ProfileLoading) {
          AppCubit.userData = ProfileLoading.userData;
          cubit.getPlants();
        } else if (state is ProfileLoadingSuccess) {
          AppCubit.Plants = ProfileLoadingSuccess.plants;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavigationScreen(),
              ),
              (Route<dynamic> route) => false);
        }
      }, builder: (BuildContext context, AppStates state) {
        AppCubit cubit = AppCubit.get(context);
        print('current stat in builder: $state');

        return Scaffold(
            body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: Image.asset("assets/images/backgtound.png").image,
            fit: BoxFit.fill,
          )),
          child: SingleChildScrollView(
            child: Column(children: [
              Center(
                child: Image(
                  height: 140,
                  width: 200,
                  image: Image.asset("assets/images/NAPTA (1)_ccexpress.png")
                      .image,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 350,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 330,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          border:
                              Border.all(color: Colors.green[600], width: 2.0),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Form(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Container(
                                      width: 320.0,
                                      height: 40.0,
                                      child: TextFormField(
                                        controller: emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            labelText: "Username",
                                            border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        25.0)),
                                            prefixIcon: Icon(Icons.email)),
                                        cursorColor: Colors.black,
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Container(
                                      width: 320.0,
                                      height: 40.0,
                                      child: TextFormField(
                                        controller: passwordController,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obscureText: passwordVisible,
                                        decoration: InputDecoration(
                                          labelText: "Password",
                                          border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.green,
                                                  width: 2.0),
                                              borderRadius:
                                                  BorderRadius.circular(25.0)),
                                          fillColor: Colors.white,
                                          prefixIcon: Icon(Icons.lock),
                                          suffixIcon: IconButton(
                                            icon: Icon(passwordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off),
                                            onPressed: () {
                                              passwordVisible =
                                                  cubit.changePasswordVisablity(
                                                      passwordVisible);
                                            },
                                          ),
                                        ),
                                        cursorColor: Colors.black,
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  FlatButton(
                                    onPressed: () {},
                                    child: Text("Forget Password!",
                                        style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: 15,
                                            fontFamily: 'Lato')),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ConditionalBuilder(
                                    condition: state is AppIntialState,
                                    builder: (context) => Container(
                                        width: 200.0,
                                        child: MaterialButton(
                                          onPressed: () {
                                            // cubit.getPlans(1);
                                            print(emailController.text);
                                            print(passwordController.text);
                                            AppCubit.userName =
                                                emailController.text;
                                            cubit.userLogin(
                                                email:
                                                    '${emailController.text}',
                                                password:
                                                    '${passwordController.text}');
                                            Plant plant =
                                                Plant(1, "Tomato", "imagepath");

                                          },
                                          color: Colors.green[900],
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Text("Login",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Lato',
                                                  fontSize: 20)),
                                        )),
                                    fallback: (context) => Center(
                                        child: CircularProgressIndicator()),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      /* Container(
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 150,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      AssetImage("assets/images/HassanNour.jpeg"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ), */
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 20, 10, 20),
                    child: Text(
                      "First Time Here",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'Lato'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
                child: Text(
                  "This application will help you in caring for plants, through which you will be able to know the pest in your plant and the way to treat it, you can know the amount of fertilizer on your land.                                                   "
                  "community that suits your interestes",
                  style: TextStyle(
                      color: Colors.black54, fontSize: 13, fontFamily: 'Lato'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 15, 8, 50),
                child: Container(
                    width: 320.0,
                    height: 40.0,
                    child: MaterialButton(
                      onPressed: () {
                       // return Fluttertoast.showToast(
                       //      msg: "Wrong Username or Password" ,
                       //      toastLength: Toast.LENGTH_LONG,
                       //      gravity: ToastGravity.TOP,
                       //      timeInSecForIosWeb: 5,
                       //      backgroundColor: Colors.green,
                       //      textColor: Colors.white,
                       //      fontSize: 16.0
                       //  );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
                        );
                      },
                      color: Colors.green[900],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text("Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Lato')),
                    )),
              )
            ]),
          ),
        ));
      }),
    );
  }
}
