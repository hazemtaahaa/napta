import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napta/modules/BottomNavigation/BottomNavigationScreen.dart';
import 'package:napta/shared/cubit/cubit.dart';
import 'package:napta/shared/cubit/states.dart';

import 'ModelScreen.dart';


class ImageAnalysis extends StatelessWidget {
  static const routeName="Image_Analysis";
  @override

  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {

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
          child: Column(children: [
            Center(
              child: Image(
                height: 120,
                width: 200,
                image: Image.asset("assets/images/NAPTA (1)_ccexpress.png").image,
              ),
            ),
            Container(
              height: 550,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 550,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.green[600], width: 1.5),
                        borderRadius: BorderRadius.circular(20), //Card
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 70,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                  AssetImage("assets/images/tomato2.jpg"),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  "Plant Type: ${AppCubit.plantDisease}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight:FontWeight.bold ,
                                      fontFamily: 'Anton',
                                      fontSize: 17),
                                ),
                              ],
                            ),
                            Row(children: [
                              SizedBox(
                                width: 120,
                              ),
                              Text(
                                "Pest Type: ${AppCubit.diseas.Name}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight:FontWeight.bold ,
                                    fontFamily: 'Anton',
                                    fontSize: 17),
                              )
                            ]),
                            SizedBox(
                              height: 15,
                            ),
                            Row(children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Identification:",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight:FontWeight.bold,
                                    fontFamily: 'Anton',
                                    color: Colors.black),
                              ),
                            ]),
                            Container(
                                padding: EdgeInsets.fromLTRB(12, 5, 10, 5),
                                child: Text(
                                  "${AppCubit.diseas.Description}",
                                  style: TextStyle(
                                      wordSpacing: 1.2,
                                      fontSize: 15,
                                      color: Colors.blueGrey[900],
                                      fontFamily: 'Lato',
                                      fontWeight:FontWeight.w500
                                  ),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Row(children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Treatment",
                                style: TextStyle(
                                    wordSpacing:1.1 ,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    fontFamily: 'Anton',
                                    color: Colors.black),
                              ),
                            ]),
                            Container(
                                padding: EdgeInsets.fromLTRB(12, 5, 10, 5),
                                child: Text(
                                  "${AppCubit.diseas.Treatment}",
                                  style: TextStyle(
                                    color: Colors.blueGrey[900],
                                    wordSpacing: 1.3,
                                    fontSize:15,
                                    fontWeight:FontWeight.w500,
                                    fontFamily: 'Lato',
                                  ),
                                )),

                          ],
                        ),

                      ),
                    ),
                  ),
                  ElevatedButton(
                    child: Text(
                      "Ok",
                      style:
                      TextStyle(color: Colors.white, fontFamily: 'Lato'),
                    ),
                    onPressed:  (){
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavigationScreen(),
                          ),
                              (Route<dynamic> route) => false);
                    },
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50)),
                        backgroundColor:
                        MaterialStateProperty.all(Colors.green[900]),
                        shape:
                        MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
                  ),
                ],
              ),
            ),
          ]),
        ));
        }),
    );
  }
}