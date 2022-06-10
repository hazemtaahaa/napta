import 'package:flutter/material.dart';


class CalculatorScreen extends StatefulWidget {
  static const routeName='Calculate';
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  static const routeName='Calculate';
  String _selectedPlant;
  int _counter = 0;
  List _plantList = ['Potatoes', 'Tomatoes', 'Bananas'];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }
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
              height: 450,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 400,
                    width: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.green[700],Colors.white],

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
                                AssetImage("assets/images/HassanNour.jpeg"),
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
                            "Chose The Plants Type",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontFamily: 'Lato',
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DropdownButton(
                                dropdownColor: Colors.white,
                                hint: Text("Select Plant",style: TextStyle(fontFamily: 'Lato'),),
                                value: _selectedPlant,
                                items: _plantList.map((item) {
                                  return DropdownMenuItem(
                                    child: Text(item),
                                    value: item,
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedPlant = newValue;
                                  });
                                }),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            "The Cultivated Area In (Acre)",
                            style: TextStyle(color: Colors.white, fontSize: 16,fontFamily: 'Anton'),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.add_circle),
                              onPressed: _incrementCounter,
                              iconSize: 40,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              '$_counter',
                              style: TextStyle(fontSize: 20,fontFamily: 'Lato',color:Colors.black),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            IconButton(
                              icon: Icon(Icons.remove_circle),
                              onPressed: _decrementCounter,
                              iconSize: 40,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          width: 250,
                          height: 40,
                          child: FloatingActionButton.extended(
                            label: Text(
                              "Calculate",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            backgroundColor: Colors.green[900],
                            onPressed: (){

                            },
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
