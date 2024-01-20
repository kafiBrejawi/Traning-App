import 'package:bmi_culc/layouts/news_app/cubit/cubit.dart';
import 'package:bmi_culc/layouts/news_app/cubit/state.dart';

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
import 'cubit/cubit.dart';
import 'cubit/cubit.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: Colors.red,
            appBarTheme: AppBarTheme(
                color: Colors.white,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))),
        home: Builder(
          builder: (context) => BlocConsumer<NewsCubit, NewsState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = NewsCubit.get(context);
              return Scaffold(
                appBar: AppBar(title: Text("NewsData"), actions: [
                  IconButton(
                      onPressed: () {
                        NavigateTo(context, Searchscreen());
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ))
                ]),
                body: cubit.screeen[cubit.currentindex],
                bottomNavigationBar: BottomNavigationBar(
                  items: cubit.BottomItem,
                  currentIndex: cubit.currentindex,
                  onTap: (index) {
                    cubit.changeBottomNavigationBar(index);
                  },
                ),
              );
            },
          ),
        ));
  }
}
