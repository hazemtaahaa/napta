import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napta/modules/update/ChangePassword.dart';
import 'package:napta/shared/cubit/cubit.dart';
import 'package:napta/shared/cubit/states.dart';

var firstNameController = TextEditingController();
var lastNameController = TextEditingController();
var phoneController = TextEditingController();

class update extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
          create: (BuildContext context) => AppCubit(),
          child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, AppStates state)
    {}, builder: (BuildContext context, AppStates state) {
            if(state is AppIntialState){
                  firstNameController.text= AppCubit.userData.FirstName;
                  lastNameController.text= AppCubit.userData.LastName;
                  phoneController.text= AppCubit.userData.PhoneNumber;
            }
            AppCubit cubit = AppCubit.get(context);
            print('current stat in builder: $state');

            return
              Scaffold(
                  body: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image
                            .asset("assets/images/backgtound.png")
                            .image,
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
                                    borderRadius: BorderRadius.circular(
                                        40), //Card
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 180,
                                        width: 180,
                                        child: Stack(
                                            alignment: Alignment.center,
                                            children: [
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
                                                  image: AssetImage(
                                                      "assets/images/Cover.png"),
                                                ),
                                              ),
                                            ]),
                                      ), //السيركل افاتار
                                      Text(
                                        "Hazem Taha",
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
                                          controller: firstNameController,
                                          autofocus: true,
                                          style: new TextStyle(
                                            fontSize: 20.0,),
                                          decoration: new InputDecoration(
                                              prefixIcon: Icon(Icons.account_circle_outlined  ),
                                            labelText: 'First Name',
                                            border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white,
                                                    width: 2.0),
                                                borderRadius:
                                                BorderRadius.circular(25.0)),
                                          ),
                                        ),
                                      ),

                                      Container(
                                        height: 70,
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller: lastNameController,
                                          autofocus: true,

                                          style: new TextStyle(
                                            fontSize: 20.0,),
                                          decoration: new InputDecoration(
                                            prefixIcon: Icon(Icons.account_circle_outlined  ),
                                            labelText: 'Last Name',
                                            border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white,
                                                    width: 2.0),
                                                borderRadius:
                                                BorderRadius.circular(25.0)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 70,
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: phoneController,
                                          style: new TextStyle(
                                            fontSize: 20.0,),
                                          decoration: new InputDecoration(

                                            prefixIcon: Icon(Icons.phone),
                                            labelText: 'Phone Number',

                                            border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white,
                                                    width: 2.0),
                                                borderRadius:
                                                BorderRadius.circular(25.0)),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ChangePassword(),
                                                  ),
                                                      (Route<
                                                      dynamic> route) => false),
                                          child: Text(
                                            "Change Password", style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.lightBlue
                                          ),)),

                                      Container(
                                        width: 250,
                                        height: 40,
                                        child: FloatingActionButton.extended(
                                          onPressed: () {},
                                          label: Text(
                                            "UPDATE",
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
                  )
              );
          }
    )
    );


    }
  }
