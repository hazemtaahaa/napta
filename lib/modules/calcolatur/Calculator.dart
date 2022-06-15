import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napta/modules/calcolatur/FertilizationPlantMOre.dart';
import 'package:napta/shared/cubit/cubit.dart';
import 'package:napta/shared/cubit/states.dart';
import 'FertilizationPlan.dart';

class CalculatorScreen extends StatelessWidget {
  static const routeName = 'Calculate';
  String _selectedPlant = 'Tomato';

  List _plantList = [
    'Tomato',
    'Apple',
    'Grape',
    'Orange',
    'Soybean',
    'Squash',
    'Potato',
    'Corn',
    'Strawberry',
    'Peach',
    'Blueberry',
    'Cherry',
    'Pepper',
    'Raspberry'
  ];
  Map<String, int> plantsID = {
    'Tomato': 1,
    'Apple': 2,
    'Grape': 3,
    'Orange': 7,
    'Soybean': 8,
    'Squash': 9,
    'Potato': 10,
    'Corn': 11,
    'Strawberry': 12,
    'Peach': 13,
    'Blueberry': 14,
    'Cherry': 15,
    'Pepper': 16,
    'Raspberry': 17
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (BuildContext context, AppStates state) {
              if(state is PlansSuccessState){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FertilizationPlant()),
                );
              }
          print('State in listener : $state');
        }, builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);

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
                  image: Image.asset("assets/images/NAPTA (1)_ccexpress.png")
                      .image,
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
                        height: 350,
                        // width: 300,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.green[600], width: 1.5),
                          borderRadius: BorderRadius.circular(40), //Card
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
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
                                    hint: Text(
                                      "Select Plant",
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          color: Colors.blueAccent),
                                    ),
                                    value: _selectedPlant,
                                    items: _plantList.map((item) {
                                      return DropdownMenuItem(
                                        child: Text(
                                          item,
                                          style: TextStyle(
                                              letterSpacing: 1, fontSize: 17),
                                        ),
                                        value: item,
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      // setState(() {
                                      _selectedPlant =
                                          cubit.selectPlant(newValue);
                                      // });
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
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.add_circle),
                                  onPressed: () {
                                    cubit.incrementCounter();
                                  },
                                  iconSize: 50,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  '${AppCubit.counter}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                IconButton(
                                  icon: Icon(Icons.remove_circle),
                                  onPressed: () {
                                    cubit.decrementCounter();
                                  },
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
                                onPressed: () {
                                  print(
                                      'PlaaaaaaaaaaaaaaantIDDDDDDDD ${plantsID[_selectedPlant]}');
                                  cubit.getPlans(plantsID[_selectedPlant]);

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
        }));
  }
}
