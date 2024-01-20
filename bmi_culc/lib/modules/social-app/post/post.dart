import 'package:bmi_culc/modules/social-app/home/HomeScreen.dart';
import 'package:bmi_culc/shared/components/componants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layouts/Social_app/social-app-cubit.dart';
import '../../../layouts/Social_app/social-app-states.dart';

class Newpost extends StatelessWidget {
  var textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SocialAppCubit(),
        child: BlocConsumer<SocialAppCubit, SocialAppState>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                  appBar: AppBar(
                      title: Text(
                        'Create Post',
                        style: TextStyle(color: Colors.black),
                      ),
                      centerTitle: true,
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      leading: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      actions: [
                        TextButton(
                            onPressed: () {
                              var now = DateTime.now();

                              if (SocialAppCubit.get(context).postImage ==
                                  null) {
                                SocialAppCubit.get(context).CreatePost(
                                  time: now.toString(),
                                  text: textcontroller.text,
                                );
                              } else {
                                SocialAppCubit.get(context).CreatePostImage(
                                    time: now.toString(),
                                    text: textcontroller.text);
                              }
                            },
                            child: Text('Add Post')),
                      ]),
                  body: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 28.0,
                              backgroundImage: NetworkImage(
                                  'https://img.freepik.com/premium-photo/young-arabic-man-having-idea-inspiration-concept_1187-75113.jpg?w=740'),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                                child: Text(
                              'Abd AL Kafi Brejawi',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: textcontroller,
                            decoration: InputDecoration(
                              hintText: 'what in your mind....?',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.photo_album,
                                            color: Colors.blueAccent,
                                            size: 28.0,
                                          ),
                                          onPressed: () {
                                            SocialAppCubit.get(context)
                                                .UploadPostImage();
                                          },
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          'Add Photo',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ])),
                            ),
                            SizedBox(width: 100.0),
                            Expanded(
                              child: Text(
                                '#tags',
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 17),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
