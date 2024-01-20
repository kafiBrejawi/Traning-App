import 'package:bmi_culc/modules/social-app/home/HomeScreen.dart';
import 'package:bmi_culc/modules/social-app/settings/Social-Settings.dart';
import 'package:bmi_culc/networks/endpoint.dart';
import 'package:bmi_culc/shared/components/componants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layouts/Social_app/social-app-cubit.dart';
import '../../../layouts/Social_app/social-app-states.dart';

class edit_profile extends StatelessWidget {
  var namecontroller = TextEditingController();
  var biocontroller = TextEditingController();
  var phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SocialAppCubit()..getuserdata(),
        child: BlocConsumer<SocialAppCubit, SocialAppState>(
            listener: (context, state) {},
            builder: (context, state) {
              var usermodel = SocialAppCubit.get(context).model;
              var profileImage = SocialAppCubit.get(context).profileImage;

              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      title: Text(
                        'Edit Profile',
                        style: TextStyle(color: Colors.black),
                      ),
                      titleSpacing: 12.0,
                      actions: [
                        TextButton(
                            onPressed: () {
                              SocialAppCubit.get(context).updateuser(
                                name: namecontroller.text,
                                phone: phonecontroller.text,
                                bio: biocontroller.text,
                              );
                              // cub.usermodel.name = namecontroller.text;
                            },
                            child: Text(
                              'Update',
                              style: TextStyle(
                                  color: Colors.orangeAccent, fontSize: 17),
                            )),
                        SizedBox(
                          width: 20,
                        )
                      ],
                      leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_left,
                            color: Colors.orangeAccent,
                            size: 44,
                          )),
                    ),
                    body: SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            children: [
                              Stack(
                                  alignment: AlignmentDirectional.topEnd,
                                  children: [
                                    if (state is SocialUpdateUserLoadingState)
                                      LinearProgressIndicator(
                                          valueColor:
                                              new AlwaysStoppedAnimation<Color>(
                                                  Colors.orangeAccent)),
                                    if (state is SocialUpdateUserLoadingState)
                                      SizedBox(
                                        height: 10,
                                      ),
                                    Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(7.0),
                                          topRight: Radius.circular(7.0),
                                        )),
                                        child: Card(
                                          elevation: 11.0,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Image(
                                            fit: BoxFit.cover,
                                            height: 200.0,
                                            width: double.infinity,
                                            image: (NetworkImage(
                                                'https://img.freepik.com/premium-photo/restaurant_23-2148014999.jpg?w=740')),
                                          ),
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: CircleAvatar(
                                            backgroundColor:
                                                Colors.orangeAccent,
                                            radius: 19.0,
                                            child: Icon(
                                              Icons.camera_sharp,
                                              color: Colors.black,
                                              size: 20,
                                            ))),
                                    Align(
                                      heightFactor: 2.2,
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      child: Stack(
                                          alignment:
                                              AlignmentDirectional.bottomEnd,
                                          children: [
                                            Container(
                                              height: 120.0,
                                              width: 120.0,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                              child: CircleAvatar(
                                                radius: 8.0,
                                                backgroundColor:
                                                    Colors.orangeAccent,
                                                child: CircleAvatar(
                                                    radius: 58.0,
                                                    backgroundImage:
                                                        (profileImage != null)
                                                            ? FileImage(
                                                                    profileImage)
                                                                as ImageProvider
                                                            : NetworkImage(
                                                                '${usermodel?.image}')),
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  SocialAppCubit.get(context)
                                                      .getProfileImage();
                                                },
                                                icon: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.orangeAccent,
                                                    radius: 19.0,
                                                    child: Icon(
                                                      Icons.edit,
                                                      color: Colors.black,
                                                      size: 20,
                                                    )))
                                          ]),
                                    ),
                                  ]),
                              SizedBox(
                                height: 7,
                              ),
                              if (SocialAppCubit.get(context).profileImage !=
                                  null)
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.orangeAccent,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextButton(
                                              onPressed: () {
                                                SocialAppCubit.get(context)
                                                    .uploadprofileimage();
                                              },
                                              child: Text(
                                                "UPDATE PROFILE",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        LinearProgressIndicator(
                                            valueColor:
                                                new AlwaysStoppedAnimation<
                                                        Color>(
                                                    Colors.orangeAccent)),
                                      ]),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    // Expanded(
                                    //   child: Column(
                                    //     children: [
                                    //       Container(
                                    //         decoration: BoxDecoration(
                                    //             color: Colors.orangeAccent,
                                    //             borderRadius:
                                    //                 BorderRadius.circular(20)),
                                    //         child: TextButton(
                                    //             onPressed: () {},
                                    //             child: Text(
                                    //               "UPDATE COVER",
                                    //               style: TextStyle(
                                    //                   color: Colors.black,
                                    //                   fontWeight:
                                    //                       FontWeight.bold),
                                    //             )),
                                    //       ),
                                    //       SizedBox(
                                    //         height: 8,
                                    //       ),
                                    //       LinearProgressIndicator(
                                    //           valueColor:
                                    //               new AlwaysStoppedAnimation<
                                    //                       Color>(
                                    //                   Colors.orangeAccent)),
                                    //     ],
                                    //   ),
                                    // )
                                  ],
                                ),
                              SizedBox(
                                height: 20,
                              ),
                              Column(children: [
                                defaultFormField(
                                    controller: namecontroller,
                                    validate: (val) {
                                      if (val!.isEmpty) {
                                        return 'يجب إدخال اسم المستخدم';
                                      }
                                      return null;
                                    },
                                    type: TextInputType.name,
                                    hint: 'abd alkafi brejawi',
                                    prefix: Icons.person),
                                SizedBox(
                                  height: 10,
                                ),
                                defaultFormField(
                                    controller: phonecontroller,
                                    validate: (val) {
                                      if (val!.isEmpty) {
                                        return 'يجب إدخال رقم الهاتف الجديد';
                                      }
                                      return null;
                                    },
                                    type: TextInputType.phone,
                                    hint: '09632568523',
                                    prefix: Icons.phone),
                                SizedBox(
                                  height: 13,
                                ),
                                defaultFormField(
                                    controller: biocontroller,
                                    validate: (val) {
                                      if (val!.isEmpty) {
                                        return 'يجب إدخال معلوماتك الشخصيية ';
                                      }
                                      return null;
                                    },
                                    type: TextInputType.name,
                                    hint: 'My Work : IT ENG',
                                    prefix: Icons.info)
                              ])
                            ],
                          )),
                    ),
                  ));
            }));
  }
}
