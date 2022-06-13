import 'package:flutter/material.dart';

import 'ModelScreen.dart';


class ImageAnalysis extends StatelessWidget {
  static const routeName="Image_Analysis";
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
              height: 500,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 440,
                    width: 330,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.green[900], Colors.white],
                      ),
                      border: Border.all(color: Colors.green[600], width: 2.0),
                      borderRadius: BorderRadius.circular(40),
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
                                AssetImage("assets/images/potatos.jpg"),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                "Plant Type:  Tomatoes",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Anton',
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          Row(children: [
                            SizedBox(
                              width: 130,
                            ),
                            Text(
                              "Pest Type:  Early Blight",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Anton',
                                  fontSize: 15),
                            )
                          ]),
                          Row(children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Identification",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Anton',
                                  color: Colors.white),
                            ),
                          ]),
                          Container(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "A caged tomato plant with a green, healthy top but the bottom leaves are yellow with brown spots.Early blight infection starts at the bottom of the plant with leaf spotting and yellowing .",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lato',
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
                              "Biology",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Anton',
                                  color: Colors.white),
                            ),
                          ]),
                          Container(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "Green leaves in the potato canopy with brown early blight lesions.Early blight lesions on potato early blight can be caused by two closely related species:Alternaria tomatophila and alternaria solani.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lato',
                                ),
                              )),
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
                                    builder: (context) => ImageAnalysis(),
                                  ),
                                      (Route<dynamic> route) => false);
                            },
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50)),
                                backgroundColor:
                                MaterialStateProperty.all(Colors.green[900]),
                                shape:
                                MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ))),
                          )
                        ],
                      ),
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
