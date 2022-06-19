import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:napta/models/plantsModel/PlantModel.dart';
import 'package:napta/models/user/loginModel.dart';
import 'package:napta/modules/update/nterstedPlants.dart';
import 'package:napta/modules/update/update.dart';
import 'package:napta/shared/cubit/cubit.dart';
import 'package:napta/shared/cubit/states.dart';

class Profile extends StatelessWidget {
  static const routeName = 'Profile';

  //Profile(this.plants);
  UserData userD;
  List<Plant> plants;
  final ImagePicker _picker = ImagePicker();
  File image;
  XFile photo;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, AppStates state) {},
      builder: (context, AppStates state) {
        AppCubit cubit = AppCubit.get(context);
        userD = AppCubit.userData;
        plants = AppCubit.Plants;
        if (plants != null) {
          plants.forEach((element) {
            print(element.Id);
            if (element.Id <= 3) {
              AppCubit.gettttttttttttttttttMyInterstedPlants()[(element.Id - 1)]
                  .plantStatus = true;
            } else if (element.Id > 3) {
              AppCubit.gettttttttttttttttttMyInterstedPlants()[(element.Id - 4)]
                  .plantStatus = true;
            }
          });
        }
        //print('userdataaaaaaaaaaa${userD}');
        //print('ssssssssssssssssaaaa${plants.length}');
        return Scaffold(
            body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset("assets/images/backgtound.png").image,
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
              Center(
                child: Image(
                  alignment: Alignment.topCenter,
                  height: 150,
                  width: 200, //Napta_img
                  image:
                  Image.asset("assets/images/NAPTA (1)_ccexpress.png")
                      .image,
                ),
              ),
                  Container(
                    height: 420,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 330,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.green[600], width: 1.5),
                            borderRadius: BorderRadius.circular(40), //Card
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 180,
                                width: 180,
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      //photo stack
                                      if(AppCubit.profileImage != null)
                                      CircleAvatar(
                                        radius: 80,
                                        backgroundImage:Image.file(
                                          AppCubit.profileImage,
                                          width: double.infinity,
                                          height: 230.0,
                                          fit: BoxFit.cover,
                                        ).image, //avtar if my img
                                      ),
                                      if(AppCubit.profileImage == null)
                                        CircleAvatar(
                                          radius: 80,
                                          backgroundImage:
                                          AssetImage("assets/images/HazemTaha.jpeg"), //avtar if my img
                                        ),
                                      Container(
                                        height: 180,
                                        width: 180,
                                        child: Image(
                                          image: AssetImage(
                                              "assets/images/Cover.png"),
                                        ),
                                      ),
                                      Container(
                                        width: 170,
                                        height: 170,
                                        alignment: Alignment.bottomRight,
                                        child: IconButton(
                                          icon: Icon(Icons.camera_alt_rounded),
                                          iconSize: 40,
                                          onPressed: ()  {
                                            AppCubit.get(context).pickProfileImage();
                                          },
                                        ),
                                      ),
                                    ]),
                              ),
                              Text(
                                '${userD.FirstName} ${userD.LastName}',
                                style: TextStyle(
                                    color: Colors.green[900],
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 50.0,
                                  ),
                                  Text(
                                    "E-mail",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none),
                                  ),
                                  SizedBox(
                                    width: 25.0,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    child: Image(
                                      image:
                                          AssetImage("assets/images/email.png"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Text(
                                    '${userD.Email}',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0,
                                        decoration: TextDecoration.none),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 52.0,
                                  ),
                                  Text(
                                    "Phone",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0,
                                        decoration: TextDecoration.none),
                                  ),
                                  SizedBox(
                                    width: 25.0,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/phone (1).png"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Text(
                                    '${userD.PhoneNumber}',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 25.0,
                                  ),
                                  Text(
                                    "Nationality",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none),
                                  ),
                                  SizedBox(
                                    width: 25.0,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/germany.png"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Container(
                                    alignment: AlignmentDirectional.center,
                                    child: Text(
                                      '${userD.NationalityName}',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.none),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                width: 250,
                                height: 40,
                                child: FloatingActionButton.extended(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => update(),
                                        ),
                                            (Route<dynamic> route) => false);
                                  },
                                  label: Text(
                                    "UPDATE",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  backgroundColor: Colors.green[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    child: Text(
                      "Interested Plants",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[900],
                          letterSpacing: 1.5),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => interstedPlants()));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 120,
                    child: StreamBuilder<Object>(
                        stream: null,
                        builder: (context, snapshot) {
                          return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              separatorBuilder: (context, index) => SizedBox(
                                    width: 10,
                                  ),
                              itemCount: plants.length,
                              itemBuilder: (context, index) {
                                return plants.isNotEmpty
                                    ? Container(
                                        width: 100,
                                        child: Column(
                                          children: [
                                            CircleAvatar(
                                              radius: 45,
                                              backgroundImage: AssetImage(
                                                  ("${plants[index].ImagePath}")),
                                            ),
                                            Text(
                                              "${plants[index].Name}",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 17,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : SizedBox();
                              });
                        }),
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
