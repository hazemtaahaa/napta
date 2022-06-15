import 'package:flutter/material.dart';
import 'package:napta/modules/calcolatur/FertilizationPlan.dart';

import 'Calculator.dart';

class FertilizationPlantMOre extends StatelessWidget {
  static const routeName = "Fertillization_More";

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
            Center(
              child: Image(
                height: 140,
                width: 200,
                image: Image.asset("assets/images/NAPTA (1)_ccexpress.png").image,
              ),
            ),
            Container(
              height: 570,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 550,
                    //width: 330,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      border:
                      Border.all(color: Colors.green[600], width: 2.0),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                              AssetImage("assets/images/Potato.jpg"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Potatoes Fertilization Plant",
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.blueGrey[800],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            height: 380,
                       //   width: 300,
                            child: Stack(
                              children: [
                                Container(
                                  height: 350,
                      //          width: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 80,
                                        child: Stack(
                                            children: [
                                          Column(children: [
                                            Row(children: [
                                              SizedBox(
                                                height: 35,
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Text(
                                                "DAP/MOP/Urea",
                                                style: TextStyle(
                                                  fontFamily: 'Lato',
                                                ),
                                              )
                                            ]),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  "DAP",
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 55,
                                                ),
                                                Text(
                                                  "MOP",
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 55,
                                                ),
                                                Text(
                                                  "Urea",
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  "158 kg",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 48,
                                                ),
                                                Text(
                                                  "243 kg",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 51,
                                                ),
                                                Text(
                                                  "334 kg",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ])
                                        ]),
                                      ),
                                      Divider(
                                        indent: 30,
                                        endIndent: 150,
                                        color: Colors.black,
                                        height: 25,
                                        thickness: 1,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            "Sowing",
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            " (First Fertilization)",
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            "DAP",
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 55,
                                          ),
                                          Text(
                                            "MOP",
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 55,
                                          ),
                                          Text(
                                            "Urea",
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            "158 kg",
                                            style: TextStyle(
                                              fontSize: 11,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 48,
                                          ),
                                          Text(
                                            "243 kg",
                                            style: TextStyle(
                                              fontSize: 11,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 51,
                                          ),
                                          Text(
                                            "334 kg",
                                            style: TextStyle(
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            "5 Week",
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            " (Second Fertilization)",
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            "DAP",
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 55,
                                          ),
                                          Text(
                                            "MOP",
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 55,
                                          ),
                                          Text(
                                            "Urea",
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            "158 kg",
                                            style: TextStyle(
                                              fontSize: 11,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 48,
                                          ),
                                          Text(
                                            "243 kg",
                                            style: TextStyle(
                                              fontSize: 11,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 51,
                                          ),
                                          Text(
                                            "334 kg",
                                            style: TextStyle(
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        indent: 30,
                                        endIndent: 40,
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50
                    ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          child: Text(
                            "Ok",
                            style:
                            TextStyle(color: Colors.white, fontFamily: 'Lato'),
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(horizontal: 50)),
                              backgroundColor:
                              MaterialStateProperty.all(Colors.green[900]),
                              shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ))),
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
