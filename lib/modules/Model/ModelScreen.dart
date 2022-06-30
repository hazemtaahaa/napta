import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:napta/modules/Model/ImageAnalysis.dart';
import 'package:napta/shared/cubit/cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:napta/shared/cubit/states.dart';

class ModelScreen extends StatelessWidget {
  File Model_image;
  static const routeName = "Model_Screen";

  Builder buildDialogItem(
      BuildContext context, String text, IconData icon, ImageSource src) {
    return Builder(
      builder: (innerContext) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
              leading: Icon(icon, color: Colors.white),
              title: Text(text),
              onTap: () async {
                final pickedFile = await ImagePicker().getImage(source: src);

                if (pickedFile != null) {
                  Model_image = File(pickedFile.path);
                }
                Navigator.of(innerContext).pop();
              })),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, AppStates state) {
        if(state is    ImageUploadedSuccecssfully ){

          Fluttertoast.showToast(
              msg: "Image Uploaded Successfully " ,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 20.0
          );
        }
       else if(state is  ImageNotRecognizedState ){
          Fluttertoast.showToast(
              msg: "Image Not Recognized!" ,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 20.0
          );
        }
      else if (state is DiseaseResultSuccessState) {
          AppCubit.diseas=DiseaseResultSuccessState.disRes;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => ImageAnalysis(),
              ),
              (Route<dynamic> route) => false);
        }
      }, builder: (BuildContext context, AppStates state) {
        AppCubit cubit = AppCubit.get(context);
        print('current stat in builder: $state');

        return Scaffold(
            body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: Image.asset("assets/images/backgtound.png").image,
            fit: BoxFit.fill,
          )),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  height: 150,
                  // width: 200,
                  image: Image.asset("assets/images/NAPTA (1)_ccexpress.png")
                      .image,
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 350,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 17),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        border:
                            Border.all(color: Colors.green[600], width: 2.0),
                        borderRadius: BorderRadius.circular(40),
                        //  color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.image),
                                onPressed: null,
                                iconSize: 40,
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_forward_ios),
                                onPressed: null,
                                iconSize: 20,
                              ),
                              Text(
                                "Image Analysis",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Lato',
                                    color: Colors.black),
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_forward_ios),
                                onPressed: null,
                                iconSize: 20,
                              ),
                              IconButton(
                                icon: Icon(Icons.library_books_rounded),
                                onPressed: null,
                                iconSize: 40,
                              ),
                            ],
                          ),
                        ),
                        ConditionalBuilder(
                          condition: state is ImageUploadedSuccecssfully,
                          builder: (context)=>Center(
                              child: CircularProgressIndicator()),
                          fallback:(context)=> Container(
                            //alignment: Alignment.bottomCenter,
                            width: 200,
                            height: 40,
                            child: ElevatedButton(
                              child: Row(
                                children: [
                                  Spacer(),
                                  Spacer(),
                                  Icon(Icons.image),
                                  Spacer(),
                                  Text(
                                    "Upload",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Lato',
                                        fontSize: 18),
                                  ),
                                  Spacer(),
                                  Spacer(),
                                ],
                              ),
                              onPressed: () {
                                cubit.getImageFromgallery();

                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.green[900]),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ))),
                            ),
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
      }),
    );
  }
}
