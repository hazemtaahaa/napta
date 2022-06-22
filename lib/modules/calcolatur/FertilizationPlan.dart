import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napta/modules/BottomNavigation/BottomNavigationScreen.dart';
import 'package:napta/modules/calcolatur/Calculator.dart';
import 'package:napta/shared/cubit/cubit.dart';
import 'package:napta/shared/cubit/states.dart';
import 'FertilizationPlantMOre.dart';

class FertilizationPlant extends StatelessWidget {
  static const routeName = "Fertillization_Plant";
 int plantsID=0;
  FertilizationPlant(int plantsID){
    if(plantsID<=3)
    this.plantsID= plantsID-1;
    else this.plantsID= plantsID-4;
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (BuildContext context, AppStates state) {

        }, builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
              body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: Image.asset("assets/images/backgtound.png").image,
              fit: BoxFit.fill,
            )),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(children: [
                Center(
                  child: Image(
                    height: 160,
                    width: 200,
                    image: Image.asset("assets/images/NAPTA (1)_ccexpress.png")
                        .image,
                  ),
                ),
                Container(
                  height: 560,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 500,
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
                                        AssetImage('${cubit.getMyInterstedPlants()[plantsID].plantImage}'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${cubit.getMyInterstedPlants()[plantsID].plantName} Fertilization Plan",
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
                              Container(
                                height: 350,
                                //  width: 300,
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.grey[300],
                                        ),
                                        child:  Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "DAP/MOP/Urea",
                                              style: TextStyle(
                                                fontFamily: 'Lato',
                                                fontSize: 15
                                              ),
                                            ),
                                            Container(
                                              height: 290,
                                              child: ListView.separated(
                                                physics: BouncingScrollPhysics(),
                                                itemCount: AppCubit.plans.length,
                                                itemBuilder:(context,index)=>Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Text(
                                                         "Week Number: ${AppCubit.plans[index].WeekNum}" ,
                                                          style: TextStyle(
                                                            fontFamily: 'Lato',
                                                            fontSize: 16,
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text(
                                                              "${AppCubit.plans[index].FertQuntities[0].FertilizerName}" ,
                                                              style: TextStyle(
                                                                fontFamily: 'Lato',
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              "${(AppCubit.plans[index].FertQuntities[0].Quantity)*AppCubit.counter} kg",
                                                              style: TextStyle(
                                                                fontSize: 13,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 25,
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text(
                                                              "${AppCubit.plans[index].FertQuntities[1].FertilizerName}",
                                                              style: TextStyle(
                                                                fontFamily: 'Lato',
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              "${(AppCubit.plans[index].FertQuntities[1].Quantity)*AppCubit.counter} kg",
                                                              style: TextStyle(
                                                                fontSize: 13,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 25,
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text(
                                                              "${AppCubit.plans[index].FertQuntities[2].FertilizerName}",
                                                              style: TextStyle(
                                                                fontFamily: 'Lato',
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              "${(AppCubit.plans[index].FertQuntities[2].Quantity)*AppCubit.counter} kg",
                                                              style: TextStyle(
                                                                fontSize: 13,
                                                              ),
                                                            ),
                                                          ],
                                                        ),

                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                           ),
                                                separatorBuilder:(context,index)=> Divider(
                                                  indent: 30,
                                                  endIndent: 150,
                                                  color: Colors.black,
                                                  height: 25,
                                                  thickness: 1,
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    child: Text(
                                      "Ok",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Lato'),
                                    ),
                                    onPressed: () =>   Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BottomNavigationScreen(),
                                        ),
                                            (Route<dynamic> route) => false)
                                    ,
                                    style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.symmetric(
                                                horizontal: 50)),
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            Colors.green[900]),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(25),
                                            ))),
                                  ),
                                ],
                              ),
                            ],

                          ),
                        ),

                      ),

                    ],
                  ),
                ),
              ]),
            ),
          ));
        }));
  }
}
