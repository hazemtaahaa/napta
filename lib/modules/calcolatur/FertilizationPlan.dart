import 'package:flutter/material.dart';
import 'package:napta/modules/calcolatur/Calculator.dart';
import 'FertilizationPlantMOre.dart';

class FertilizationPlant extends StatelessWidget {
  static const routeName = "Fertillization_Plant";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset("assets/images/backgtound.png").image,
                fit: BoxFit.fill,
              )),
          child: Column(
              children: [
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
              height: 560,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 495,
                      //width: 330,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        border: Border.all(color: Colors.green[600], width: 2.0),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
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
                                  color: Colors.blueGrey[800],),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 400,
                          //  width: 300,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    //height: 300,
                                   // width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        // mainAxisAlignment:MainAxisAlignment.start ,
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              "DAP/MOP/Urea",
                                              style: TextStyle(

                                                fontFamily: 'Lato',
                                              ),
                                            ),
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
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Text(
                                                "3 1/4 Bags",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 31,
                                              ),
                                              Text(
                                                "4 3/4 Bags",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 32,
                                              ),
                                              Text(
                                                "4 1/2 Bags",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                  icon: Icon(Icons.arrow_circle_down),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                           builder: (context) => FertilizationPlantMOre()),
                                                    );
                                                  },
                                                  color: Colors.black),
                                            ],
                                          ),
                                          Divider(
                                            color: Colors.black,
                                            indent: 20,
                                            endIndent: 20,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 50,
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Text(
                                                "MOP/SSP/Urea",
                                                style: TextStyle(
                                                  fontFamily: 'Lato',
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
                                                "SSP",
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
                                                "243 kg",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 48,
                                              ),
                                              Text(
                                                "455 kg",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 48,
                                              ),
                                              Text(
                                                "334 kg",
                                                style: TextStyle(
                                                  fontSize: 11,
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
                                                "4 3/4 Bags",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Text(
                                                "9 1/4 Bags",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 26,
                                              ),
                                              Text(
                                                "7 3/4 Bags",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                icon: Icon(Icons.arrow_circle_down),
                                                onPressed: () {},
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                Column(
                                  mainAxisAlignment:MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(

                                      child: Text(
                                        "Ok",
                                        style:
                                        TextStyle(color: Colors.white, fontFamily: 'Lato'),
                                      ),
                                      onPressed: () => Navigator.of(context)
                                          .pushNamed(CalculatorScreen.routeName),
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
          ]),
        ));
  }
}
