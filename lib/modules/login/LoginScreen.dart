import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napta/models/plantsModel/PlantModel.dart';
import 'package:napta/modules/profile/profile.dart';
import 'package:napta/modules/register/RegisterScreen.dart';
import 'package:napta/modules/update/nterstedPlants.dart';
import 'package:napta/shared/cubit/cubit.dart';
import 'package:napta/shared/cubit/states.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  @override
  var formkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, AppStates state) {
            AppCubit cubit = AppCubit.get(context);
            print('current stat in listener: $state');
            if (state is UserLoginSuccess) {
              AppCubit.Token=UserLoginSuccess.token;

              cubit.getUserData();
            } else if (state is ProfileLoading) {
              AppCubit.userData = ProfileLoading.userData;
              cubit.getPlants();
            } else if (state is ProfileLoadingSuccess) {
              AppCubit.Plants = ProfileLoadingSuccess.plants;
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
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
                  Row(
                    children: [
                      SizedBox(
                        width: 80,
                      ),
                      Image(
                        height: 140,
                        width: 200,
                        image: Image.asset("assets/images/NAPTA (1)_ccexpress.png")
                            .image,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      height: 280,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 280,
                            width: 330,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.green, Colors.white],
                              ),
                              border:
                              Border.all(color: Colors.green[600], width: 2.0),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Form(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Container(
                                        width: 300.0,
                                        height: 35.0,
                                        child: TextFormField(
                                          controller: emailController,
                                          keyboardType: TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                              labelText: "Username",
                                              border: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white,
                                                      width: 2.0),
                                                  borderRadius:
                                                  BorderRadius.circular(25.0)),
                                              prefixIcon: Icon(Icons.email)),
                                          cursorColor: Colors.black,
                                        )),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Container(
                                        width: 300.0,
                                        height: 40.0,
                                        child: TextFormField(
                                          controller: passwordController,
                                          keyboardType:
                                          TextInputType.visiblePassword,
                                          obscureText: true,
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
                                            suffixIcon: Icon(Icons.remove_red_eye),
                                          ),
                                          cursorColor: Colors.black,
                                        )),
                                    FlatButton(
                                      onPressed: () {},
                                      child: Text("Forget Password!",
                                          style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontSize: 13,
                                              fontFamily: 'Lato')),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ConditionalBuilder(
                                      condition: state is! UserLoginLoading,
                                      builder: (context) => Container(
                                          width: 150.0,
                                          child: MaterialButton(
                                            onPressed: () {
                                              print(emailController.text);
                                              print(passwordController.text);
                                              AppCubit.userName =
                                                  emailController.text;
                                              cubit.userLogin(
                                                  email: '${emailController.text}',
                                                  password:
                                                  '${passwordController.text}');
                                              Plant plant =
                                              Plant(1, "Tomato", "imagepath");
                                              print(plant.toJson());
                                            },
                                            color: Colors.green,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(20)),
                                            child: Text("Login",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Lato',
                                                    fontSize: 16)),
                                          )),
                                      fallback: (context) => Center(
                                          child: CircularProgressIndicator()),
                                    ),
                                  ],
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
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        height: 60,
                        width: 70,
                      ),
                      Text(
                        "First Time Here",
                        style: TextStyle(
                            color: Colors.black, fontSize: 15, fontFamily: 'Lato'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 8, 8, 8),
                    child: Text(
                      "This application will help you in caring for plants, through which you will be able to know the pest in your plant and the way to treat it, you can know the amount of fertilizer on your land.                                                   "
                          "community that suits your interestes",
                      style: TextStyle(
                          color: Colors.black38, fontSize: 13, fontFamily: 'Lato'),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()),
                            );
                          },
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text("Register",
                              style: TextStyle(color: Colors.white)),
                        )),
                  )
                ]),
              ),
            )
        );
      }
      ),
    );
  }
}
