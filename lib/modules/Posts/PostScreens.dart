import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napta/modules/Posts/CommentScreen.dart';
import 'package:napta/modules/Posts/CreatPostScreen.dart';
import 'package:napta/shared/cubit/cubit.dart';
import 'package:napta/shared/cubit/states.dart';

class PostScreen extends StatelessWidget {
  @override
  bool isPrassed = false;
  int selectedIndex = 0;

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, AppStates state) {
        if (state is CommentUploadedSuccessfully) {
          AppCubit.Comments = CommentUploadedSuccessfully.comments;
          showBottomSheet(
              context: context,
              builder: (Context) {
                return CommentsScreen(AppCubit.Posts[selectedIndex].PostId);
              });
        }
      }, builder: (BuildContext context, AppStates state) {
        AppCubit cubit = AppCubit.get(context);
        print('current stat in builder: $state');
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreatePost()),
                  );
                },
                child: Text(
                  "Create Post",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 16,
                    fontFamily: 'Lato',
                  ),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: Container(
                    height: double.maxFinite,
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        //shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 5.0,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(children: [
                                  Row(
                                    children: [
                                      if (AppCubit
                                          .Posts[index].UserImage.isNotEmpty)
                                        CircleAvatar(
                                          radius: 25.0,
                                          backgroundImage: AssetImage(
                                              AppCubit.Posts[index].UserImage),
                                        )
                                      else
                                        CircleAvatar(
                                          radius: 25.0,
                                          backgroundImage: AssetImage(
                                              "assets/images/UserImageDef.jpeg"),
                                        ),
                                      SizedBox(width: 15),
                                      Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(children: [
                                                Text(
                                                  "${AppCubit.Posts[index].FirstName} ${AppCubit.Posts[index].LastName} ",
                                                  style: TextStyle(
                                                      height: 1.4,
                                                      fontFamily: 'Lato'),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Icon(
                                                  Icons.check_circle,
                                                  size: 16,
                                                  color: Colors.blue,
                                                ),
                                              ]),
                                              Text(
                                                "${AppCubit.Posts[index].CreationDate}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    .copyWith(height: 1.4),
                                              ),
                                            ]),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      IconButton(
                                          icon: Icon(Icons.more_horiz),
                                          onPressed: () {})
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Container(
                                      width: double.infinity,
                                      height: 1.0,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  Text(
                                    "${AppCubit.Posts[index].Content}",
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 14,
                                      height: 1.3,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Container(
                                      width: double.infinity,
                                      height: 1.0,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  ConditionalBuilder(
                                    condition:
                                        AppCubit.Posts[index].Image != null,
                                    builder: (context) => Container(
                                      height: 300,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: Image.asset(
                                                "${AppCubit.Posts[index].Image}")
                                            .image,
                                      )),
                                    ),
                                    fallback: (context) => SizedBox(),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 3),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.favorite,
                                                  size: 20,
                                                  color: Colors.green,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "${AppCubit.Posts[index].NumberOfLikes} Likes",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption,
                                                ),
                                              ],
                                            ),
                                          ),
                                          onTap: () {},
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 3),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(
                                                  Icons.chat_bubble,
                                                  size: 20,
                                                  color: Colors.amber,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "${AppCubit.Posts[index].NumberOfComments} comments",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption,
                                                ),
                                              ],
                                            ),
                                          ),
                                          onTap: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Container(
                                      width: double.infinity,
                                      height: 1.0,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          child: Row(
                                            children: [
                                              if (AppCubit.Posts[index]
                                                  .UserImage.isNotEmpty)
                                                CircleAvatar(
                                                  radius: 25.0,
                                                  backgroundImage: AssetImage(
                                                      AppCubit.Posts[index]
                                                          .UserImage),
                                                )
                                              else
                                                CircleAvatar(
                                                  radius: 25.0,
                                                  backgroundImage: AssetImage(
                                                      "assets/images/UserImageDef.jpeg"),
                                                ),
                                              SizedBox(width: 14),
                                              Text(
                                                "Write a comment ...",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    .copyWith(fontSize: 14),
                                              )
                                            ],
                                          ),
                                          onTap: () {
                                            selectedIndex = index;
                                            cubit.getComments(
                                                AppCubit.Posts[index].PostId);
                                            // showBottomSheet(
                                            //     context: context,
                                            //     builder: (Context) {
                                            //       return CommentsScreen();
                                            //     });
                                          },
                                        ),
                                      ),
                                      InkWell(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                AppCubit.Posts[index].IsLiked
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                size: 22,
                                                color: Colors.green,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Like",
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          if (AppCubit.Posts[index].IsLiked)
                                            cubit.UserDislike(index,
                                                AppCubit.Posts[index].PostId);
                                          else
                                            cubit.UserLike(index,
                                                AppCubit.Posts[index].PostId);
                                        },
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 15,
                            ),
                        itemCount: AppCubit.Posts.length),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
