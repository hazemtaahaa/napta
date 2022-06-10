import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napta/models/plantsModel/PlantModel.dart';
import 'package:napta/modules/profile/profile.dart';
import 'package:napta/shared/cubit/cubit.dart';
import 'package:napta/shared/cubit/states.dart';
import 'package:napta/shared/network/remote/dio_helper.dart';

class interstedPlants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is InterestedPlantsUpdated) {
            //   Navigator.pushAndRemoveUntil(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => Profile(),
            //       ),
            //       (Route<dynamic> route) => false);
            // }
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset("assets/images/backgtound.png").image,
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.green[600], width: 1.50),
                        borderRadius: BorderRadius.circular(30), //Card
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              'Interested Plants',
                              style: TextStyle(
                                letterSpacing: 2,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.blueGrey[800],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 500,
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 10,
                                ),
                                itemCount: cubit.getMyInterstedPlants().length,
                                itemBuilder: (context, index) => Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  height: 100,
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 80,
                                        backgroundImage: AssetImage(
                                            ("${AppCubit.get(context).getMyInterstedPlants()[index].plantImage}")), //avatar of my img
                                      ),
                                      Spacer(),
                                      Text(
                                        "${AppCubit.get(context).getMyInterstedPlants()[index].plantName}",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.5,
                                            decoration: TextDecoration.none,
                                            color: Colors.blueGrey[800]),
                                      ),
                                      Spacer(),
                                      Transform.scale(
                                        scale: 1.5,
                                        child: Checkbox(
                                          checkColor: Colors.white,
                                          fillColor: MaterialStateProperty.all(
                                              Colors.cyanAccent),
                                          activeColor: Colors.orange,
                                          value: AppCubit.get(context)
                                              .getMyInterstedPlants()[index]
                                              .plantStatus,
                                          onChanged: (bool value) {
                                            cubit.changePlantStats(
                                                states: !cubit
                                                    .getMyInterstedPlants()[
                                                        index]
                                                    .plantStatus,
                                                index: index);

                                            print(
                                                "${cubit.getMyInterstedPlants()[index].plantName}   ${cubit.getMyInterstedPlants()[index].plantStatus}");
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
///////////////////////////////////////////////
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              height: 40,
                              child: FloatingActionButton.extended(
                                onPressed: () {
                                  //cubit.getPlants();
                                  // cubit.InsertNewPlants(cubit.getMyInterstedPlants());
                                  AppCubit.Plants.clear();
                                  List<Map<String, dynamic>> interestedPlants =
                                      [];
                                  cubit
                                      .getMyInterstedPlants()
                                      .forEach((element) {
                                    if (element.plantStatus) {
                                      Plant plant = Plant(
                                          element.id,
                                          element.plantName,
                                          element.plantImage);
                                      AppCubit.Plants.add(plant);
                                      var p = plant.toJson();
                                      interestedPlants.add(p);
                                    }
                                  });
                                  cubit.postPlants(plants: interestedPlants);
                                  print(interestedPlants.last);
                                  Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>Profile())

                                  );
                                },
                                label: Text(
                                  "UPDATE",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                backgroundColor:
                                    Colors.green[900].withOpacity(.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
