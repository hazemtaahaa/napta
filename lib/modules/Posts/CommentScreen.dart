import 'package:flutter/material.dart';

class CommentsScreen extends StatelessWidget {
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      width: MediaQuery.of(context).size.width,
      color: Colors.black12,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 150.0),
              child: Divider(
                thickness: 4.0,
                color: Colors.white,
              ),
            ),
            Container(
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Text(
                  'Comments',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                    fontFamily: 'Lato',
                  ),
                ),
              ),
            ),
            Container(
              height: 420,
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundImage:
                              AssetImage("assets/images/HassanNour.jpeg"),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Hassan Nour",
                                        style: TextStyle(
                                            height: 1.4, fontFamily: 'Lato'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "My Name Is Hassan, I am Software Engineer in Gogol, Can I Help You ? ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,

                                        height: 1),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                  itemCount: 15),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(

                width: 400,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: 250,
                      height: 50,
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                            hintText: 'Add Comment...',
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Lato',
                            )),
                        controller: commentController,
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.comment,
                        color: Colors.white,
                        size: 20,
                      ),
                      backgroundColor: Colors.green,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/* Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage:
                          AssetImage("assets/images/HassanNour.jpeg"),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Hassan Nour",
                                style: TextStyle(height: 1.4, fontFamily: 'Lato'),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "How can I grow some plants at home, such as potatoes or pepper ?",
                            style: TextStyle(color: Colors.black,fontSize: 12,height: 1),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),*/
