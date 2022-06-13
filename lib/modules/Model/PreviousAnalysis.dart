import 'package:flutter/material.dart';

import 'ImageAnalysis.dart';
//import 'package:napta_final/image_analysis_screen.dart';

class PreviousAnalysis extends StatelessWidget {
  static const routeName="previous_analysis";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(

              image: DecorationImage(
                image: Image.asset("assets/images/backgtound.png").image,
                fit: BoxFit.fill,
              )),
          child: Column(children: [
            Row(
              children: [
                SizedBox(
                  width: 80,
                ),
                Image(
                  height: 140,
                  width: 200,
                  image: Image.asset("assets/images/NAPTA (1)_ccexpress.png").image,
                )
              ],
            ),
            Container(
              height: 480,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 410,
                    width: 330,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.green[900],Colors.white],

                      ),
                      border: Border.all(color: Colors.green[600], width: 2.0),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 70,
                                backgroundImage:
                                AssetImage("assets/images/HazemTaha.jpeg"),
                              ),
                              Container(
                                height: 150,
                                width: 150,
                                child: Image(
                                  image: AssetImage("assets/images/Cover.png"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Text(
                            "Previous Analysis",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontFamily: 'Lato',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                            AssetImage("assets/images/Apple.jpg"),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Apple",
                            style: TextStyle(fontSize: 15,fontFamily: 'Lato'),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            "10/4/2022",
                            style: TextStyle(fontSize: 15,fontFamily: 'Lato'),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.orangeAccent,
                            child: IconButton(
                              icon: Icon(Icons.arrow_forward_ios), onPressed:  () {

                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ImageAnalysis(),
                                  ),
                                      (Route<dynamic> route) => false);

                            }

                            ),
                          )
                        ]),
                        SizedBox(height: 20,),
                        Divider(
                          thickness:1,
                          color: Colors.white,
                          indent: 50,
                          endIndent: 50,

                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                            AssetImage("assets/images/tomato2.jpg"),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Tomatoes",
                            style: TextStyle(fontSize: 15,fontFamily: 'Lato'),
                          ),
                          SizedBox(
                            width: 46,
                          ),
                          Text(
                            "10/4/2022",
                            style: TextStyle(fontSize: 15,fontFamily: 'Lato'),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.orangeAccent,
                            child: IconButton(
                                icon: Icon(Icons.arrow_forward_ios), onPressed: null),
                          )
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
