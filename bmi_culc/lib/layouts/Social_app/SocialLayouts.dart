import 'package:bmi_culc/layouts/Social_app/social-app-cubit.dart';
import 'package:bmi_culc/layouts/Social_app/social-app-states.dart';
import 'package:bmi_culc/layouts/news_app/cubit/cubit.dart';
import 'package:bmi_culc/layouts/news_app/cubit/state.dart';
import 'package:bmi_culc/modules/social-app/post/post.dart';

import 'package:bmi_culc/networks/local/remote/dio_helper.dart';
import 'package:bmi_culc/shared/components/componants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../modules/news_app/search/search_screen.dart';
import '../../modules/social-app/search/search.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
            builder: (context) => BlocProvider(
                create: (BuildContext context) =>
                    SocialAppCubit()..getuserdata(),
                child: BlocConsumer<SocialAppCubit, SocialAppState>(
                  listener: (context, state) {
                    if (state is SocialNewPostState) {
                      NavigateTo(context, Newpost());
                    }
                  },
                  builder: (context, state) {
                    var Cubit = SocialAppCubit.get(context);
                    return Scaffold(
                      appBar: AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 2.0
                          title: Text(
                            Cubit.title[Cubit.currentindex],
                            style: TextStyle(color: Colors.grey),
                          ),
                          actions: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                )),
                            IconButton(
                                onPressed: () {
                                  NavigateTo(context, search());
                                },
                                icon: Icon(
                                  Icons.notifications_active,
                                  color: Colors.black,
                                ))
                          ]),
                      body: Cubit.screeen[Cubit.currentindex],
                      bottomNavigationBar: BottomNavigationBar(
                        selectedItemColor: Colors.deepOrange,
                        selectedFontSize: 14.0,
                        unselectedFontSize: 12.0,
                        unselectedItemColor: Colors.grey,
                        unselectedLabelStyle: TextStyle(color: Colors.black),
                        showUnselectedLabels: true,
                        backgroundColor: Colors.orangeAccent,
                        items: Cubit.BottomItem,
                        currentIndex: Cubit.currentindex,
                        onTap: (index) {
                          Cubit.changeBottomNavigationBar(index);
                        },
                      ),
                    );
                  },
                ))));
  }
}
