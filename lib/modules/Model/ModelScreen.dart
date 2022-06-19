import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
              height: 350,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        border: Border.all(color: Colors.green[600], width: 2.0),
                        borderRadius: BorderRadius.circular(40),
                        //color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.image),
                                onPressed: null,
                                iconSize: 60,
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_forward_ios),
                                onPressed: null,
                                iconSize: 19,
                              ),
                              Text(
                                "Image Analysis",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                    color: Colors.black),
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_forward_ios),
                                onPressed: null,
                                iconSize: 19,
                              ),
                              IconButton(
                                icon: Icon(Icons.library_books_rounded),
                                onPressed: null,
                                iconSize: 60,
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            width: 250,
                            height: 40,
                            child: ElevatedButton(
                              child: Text(
                                "Capture/Upload",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Lato'),
                              ),
                              onPressed: () {
                                var ad = AlertDialog(
                                  title: Text(
                                    "Chose Picture From:",
                                    style: TextStyle(fontFamily: 'Lato'),
                                  ),
                                  content: Container(
                                    height: 150,
                                    child: Column(
                                      children: [
                                        Divider(color: Colors.black),
                                        buildDialogItem(
                                            context,
                                            "Camera",
                                            Icons.add_a_photo_outlined,
                                            ImageSource.camera),
                                        SizedBox(height: 10),
                                        buildDialogItem(
                                            context,
                                            "Gallery",
                                            Icons.image_outlined,
                                            ImageSource.gallery),
                                      ],
                                    ),
                                  ),
                                );
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return ad;
                                    });
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(Colors.green[900]),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
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

            Padding(
              padding: const EdgeInsets.fromLTRB(50, 80, 50, 20),
              child: ElevatedButton(
                child: Text(
                  "Previous Analysis",
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Lato', fontSize: 20),
                ),
                onPressed: () {

                },

                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                    backgroundColor: MaterialStateProperty.all(Colors.green[900]),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ))),
              ),
            )
          ]),
        ));
  }
}
