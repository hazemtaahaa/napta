import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return  BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {


    },
    builder: (BuildContext context, AppStates state) {
    AppCubit cubit = AppCubit.get(context);
    print('current stat in builder: $state');

    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset("assets/images/backgtound.png").image,
                fit: BoxFit.fill,
              )),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  height: 150,
                 // width: 200,
                  image: Image.asset("assets/images/NAPTA (1)_ccexpress.png").image,
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
                        border: Border.all(color: Colors.green[600], width: 2.0),
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

                        Container(
                          //alignment: Alignment.bottomCenter,
                          width: 200,
                          height: 40,
                          child: ElevatedButton(

                            child: Row(
                              children: [
                                Spacer(),  Spacer(),
                                Icon(Icons.image),
                               Spacer(),
                                Text(
                                  "Upload",
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'Lato',fontSize: 18),
                                ),
                                Spacer(),
                                Spacer(),
                              ],
                            ),
                            onPressed: () {
                              cubit.getImageFromgallery();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ImageAnalysis(),
                                  ),
                                      (Route<dynamic> route) => false);
                              // var ad = AlertDialog(
                              //   title: Text(
                              //     "Chose Picture From:",
                              //     style: TextStyle(fontFamily: 'Lato'),
                              //   ),
                              //   content: Container(
                              //     height: 150,
                              //     child: Column(
                              //       children: [
                              //         Divider(color: Colors.black),
                              //        Row(
                              //          mainAxisAlignment:MainAxisAlignment.center,
                              //          children: [
                              //            IconButton(icon:Icon(Icons.camera_alt_outlined,color:Colors.green[900],size:35), onPressed: (){
                              //              cubit.getImageFromCamera();
                              //            }),
                              //            Text("Camera",style:TextStyle(
                              //              fontSize:15
                              //            ),)
                              //          ],
                              //        ),
                              //
                              //         SizedBox(height: 10),
                              //         Row(
                              //           mainAxisAlignment:MainAxisAlignment.center,
                              //           children: [
                              //             IconButton(
                              //                 icon:Icon(Icons.image,color:Colors.green[900],size:35,), onPressed: (){
                              //               cubit.getImageFromgallery();
                              //             }),
                              //             Text("Gallery",style:TextStyle(
                              //                 fontSize:15
                              //             ),)
                              //           ],
                              //         ),
                              //
                              //       ],
                              //     ),
                              //   ),
                              // );
                              // showDialog(
                              //     context: context,
                              //     builder: (context) {
                              //       return ad;
                              //     });
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(Colors.green[900]),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),


          ]),
        )
              );
    }),
    );
  }
}