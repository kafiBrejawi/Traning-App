import 'package:bmi_culc/networks/local/cache_helper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layouts/Social_app/social-app-cubit.dart';
import '../../../layouts/Social_app/social-app-states.dart';
import '../../../layouts/news_app/cubit/cubit.dart';
import '../../../shared/components/componants.dart';
import '../edit-profile/edit_profile_screen.dart';
import '../social-login/login.dart';

class SocialSettings extends StatelessWidget {
  const SocialSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit, SocialAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var usermodel = SocialAppCubit.get(context).model;

        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(children: [
            Stack(children: [
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7.0),
                    topRight: Radius.circular(7.0),
                  )),
                  child: Card(
                    elevation: 11.0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image(
                      fit: BoxFit.cover,
                      height: 200.0,
                      width: double.infinity,
                      image: (NetworkImage(
                          'https://img.freepik.com/premium-photo/restaurant_23-2148014999.jpg?w=740')),
                    ),
                  )),
              Align(
                heightFactor: 2.2,
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: CircleAvatar(
                    radius: 8.0,
                    backgroundColor: Colors.orangeAccent,
                    child: CircleAvatar(
                      radius: 58.0,
                      backgroundImage: NetworkImage('${usermodel?.image}'),
                    ),
                  ),
                ),
              ),
            ]),
            SizedBox(
              height: 7,
            ),
            Text(
              '${usermodel?.name}',
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              '${usermodel?.bio}',
              style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none),
            ),
            SizedBox(
              height: 11,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Text(
                          '10k',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Followers',
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Text(
                          '12k',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Following',
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Text(
                          '14',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Photo',
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Text(
                          '100',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Post',
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: OutlinedButton(
                        onPressed: () {}
                        //CacheHelper.removedata(key: 'uid').then((value) {
                        //  if (value) {
                        // navigateandfinish(context, LoginSocial());

                        ,
                        child: Text(
                          "Add Photo",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                OutlinedButton(
                  onPressed: () {
                    NavigateTo(context, edit_profile());
                  },
                  child: Icon(
                    Icons.edit,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ]),
        );
      },
    );
  }
}
