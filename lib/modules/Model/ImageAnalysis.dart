import 'package:flutter/material.dart';

import 'ModelScreen.dart';


class ImageAnalysis extends StatelessWidget {
  static const routeName="Image_Analysis";
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
            Container(
              height: 600,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 570,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.green[600], width: 1.5),
                        borderRadius: BorderRadius.circular(20), //Card
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 70,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                  AssetImage("assets/images/tomato2.jpg"),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  "Plant Type:  Tomatoes",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight:FontWeight.bold ,
                                      fontFamily: 'Anton',
                                      fontSize: 17),
                                ),
                              ],
                            ),
                            Row(children: [
                              SizedBox(
                                width: 120,
                              ),
                              Text(
                                "Pest Type:  Early Blight",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight:FontWeight.bold ,
                                    fontFamily: 'Anton',
                                    fontSize: 17),
                              )
                            ]),
                            SizedBox(
                              height: 15,
                            ),
                            Row(children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Identification:",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight:FontWeight.bold,
                                    fontFamily: 'Anton',
                                    color: Colors.black),
                              ),
                            ]),
                            Container(
                                padding: EdgeInsets.fromLTRB(12, 5, 10, 5),
                                child: Text(
                                  "The first symptoms of the disease appear in the form of dark spots with concentric growth and yellow halos on the leaves. Followed by drying and falling of leaves. The fruits may begin to rot and eventually fall off. Symptoms of early blight occur on old foliage, stems, and fruits.  Grayish-brown spots appear on the foliage, and gradually grow concentrically around a clear center - forming the distinctive shooting target appearance.  These spots are surrounded by a bright yellow halo.  As the disease progresses, entire leaves may turn yellow due to chlorophyll deficiency and fall off, resulting in significant defoliation.  When the leaves die and fall, the fruits become more susceptible to sunburn.  The same type of spots with a clear center appears on the stems and fruits.  Fruits begin to rot and may eventually fall off.",
                                  style: TextStyle(
                                 wordSpacing: 1.2,
                                    fontSize: 15,
                                    color: Colors.blueGrey[900],
                                    fontFamily: 'Lato',
                                    fontWeight:FontWeight.w500
                                  ),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Row(children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Treatment",
                                style: TextStyle(
                                  wordSpacing:1.1 ,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    fontFamily: 'Anton',
                                    color: Colors.black),
                              ),
                            ]),
                            Container(
                                padding: EdgeInsets.fromLTRB(12, 5, 10, 5),
                                child: Text(
                                       "1. Prune or stake plants to improve air circulation and reduce fungal problems.\n"
                                      "2. Make sure to disinfect your pruning shears (one part bleach to 4 parts water) after each cut.\n"
                                      "3. Keep the soil under plants clean and free of garden debris. Add a layer of organic compost to prevent the spores from splashing back up onto vegetation.\n"
                                      "4. Drip irrigation and soaker hoses can be used to help keep the foliage dry.\n"
                                      "5. For best control, apply copper-based fungicides early, two weeks before disease normally appears or when weather forecasts predict a long period of wet weather. Alternatively, begin treatment when disease first appears, and repeat every 7-10 days for as long as needed.\n"
                                      "6. Containing copper and pyrethrins, Bonide® Garden Dust is a safe, one-step control for many insect attacks and fungal problems. For best results, cover both the tops and undersides of leaves with a thin uniform film or dust. Depending on foliage density, 10 oz will cover 625 sq ft. Repeat applications every 7-10 days, as needed.\n"
                                      "7- SERENADE Garden is a broad spectrum, preventative bio-fungicide recommended for the control or suppression of many important plant diseases. For best results, treat prior to foliar disease development or at the first sign of infection. Repeat at 7-day intervals or as needed.\n"
                                      "8- Remove and destroy all garden debris after harvest and practice crop rotation the following year.\n"
                                      "9- Burn or bag infected plant parts. Do NOT compost",
                                  style: TextStyle(
                                    color: Colors.blueGrey[900],
                                    wordSpacing: 1.3,
                                    fontSize:15,
                                    fontWeight:FontWeight.w500,
                                    fontFamily: 'Lato',
                                  ),
                                )),

                          ],
                        ),

                      ),
                    ),
                  ),
                  ElevatedButton(
                    child: Text(
                      "Ok",
                      style:
                      TextStyle(color: Colors.white, fontFamily: 'Lato'),
                    ),
                    onPressed:  (){
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageAnalysis(),
                          ),
                              (Route<dynamic> route) => false);
                    },
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50)),
                        backgroundColor:
                        MaterialStateProperty.all(Colors.green[900]),
                        shape:
                        MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
