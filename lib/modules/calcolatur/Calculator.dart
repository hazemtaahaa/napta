import 'package:flutter/material.dart';

import 'FertilizationPlan.dart';


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

                Center(
                  child: Image(
                    height: 140,
                    width: 200,
                    image: Image.asset("assets/images/NAPTA (1)_ccexpress.png").image,
                  ),
                ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 450,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: 300,
                      // width: 300,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.green[600], width: 1.5),
                        borderRadius: BorderRadius.circular(40), //Card
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    Container(
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Container(
                              child: Text(
                                "Chose The Plants Type",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueGrey[800],
                                  fontFamily: 'Lato',
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DropdownButton(
                                    dropdownColor: Colors.white,
                                    hint: Text("Select Plant",style: TextStyle(fontFamily: 'Lato',color: Colors.blueAccent),),
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
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blueGrey[800],
                                    fontFamily: 'Anton'),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.add_circle),
                                  onPressed: _incrementCounter,
                                  iconSize: 50,
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
                                  iconSize: 50,
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FertilizationPlant()),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),

                    ),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
