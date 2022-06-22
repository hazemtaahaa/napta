import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napta/models/PostModel/PostModel.dart';
import 'package:napta/shared/cubit/cubit.dart';
import 'package:napta/shared/cubit/states.dart';

class CommentsScreen extends StatelessWidget {
  TextEditingController commentController = TextEditingController();
  int PostId;

  CommentsScreen(int postId) {
    PostId = postId;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, AppStates state) {


          },
          builder: (BuildContext context, AppStates state) {
            AppCubit cubit = AppCubit.get(context);
            print('current stat in builder: $state');

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
                                        if( AppCubit.Comments[index].UserImage != null)
                                          CircleAvatar(
                                            radius: 25.0,
                                            backgroundImage: AssetImage(
                                                AppCubit.Comments[index].UserImage),
                                          )
                                        else
                                          CircleAvatar(
                                            radius: 25.0,
                                            backgroundImage: AssetImage(
                                                "assets/images/HazemTaha.jpeg"),
                                          ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "${AppCubit.Comments[index].FirstName} ${AppCubit.Comments[index].LastName}",
                                                    style: TextStyle(
                                                        height: 1.4,
                                                        fontFamily: 'Lato'),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '${AppCubit.Comments[index].Content}',
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
                          itemCount: AppCubit.Comments.length),
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
                                textCapitalization:
                                    TextCapitalization.sentences,
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
                              onPressed: () {
                                Comment comment = Comment(
                                    commentController.text,
                                    AppCubit.userName,
                                    PostId);
                                cubit.postComment(Comment: comment.toJson(),com: comment);

                                commentController.clear();


                              },
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
          }),
    );
  }
}
