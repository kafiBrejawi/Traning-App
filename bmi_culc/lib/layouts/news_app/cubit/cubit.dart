import 'package:bloc/bloc.dart';
import 'package:bmi_culc/layouts/news_app/cubit/state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../modules/news_app/seinces/business/business.dart';
import '../../../modules/news_app/seinces/seinces.dart';
import '../../../modules/news_app/sports/sport.dart';
import '../../../networks/local/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;
  List<BottomNavigationBarItem> BottomItem = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business_sharp,
        ),
        label: 'bussniess'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'sport'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'science'),
  ];

  List<Widget> screeen = [
    Business(),
    Sport(),
    Sinces(),
  ];

  void changeBottomNavigationBar(int index) {
    currentindex = index;
    if (index == 1) Getsports();
    if (index == 2) Getscience();
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void Getbusiness() {
    emit(NewsGetbusinessLoadingState());
    if (business.length == 0) {
      DioHelper.GetHomeData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'business',
          'apiKey': '132a7f037415475c89622a9807e54079',
        },
      ).then((value) {
        business = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetbusinessSucsessState());
      }).catchError((erorr) {
        print(erorr.toString());
        emit(NewsGetbusinessErorrState(erorr.toString()));
      });
    } else {
      emit(NewsGetbusinessSucsessState());
    }
  }

  List<dynamic> sports = [];
  void Getsports() {
    emit(NewsGetsportsLoadingState());
    if (sports.length == 0) {
      DioHelper.GetHomeData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sports',
          'apiKey': '132a7f037415475c89622a9807e54079',
        },
      ).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetsportsSucsessState());
      }).catchError((erorr) {
        print(erorr.toString());
        emit(NewsGetsportsErorrState(erorr.toString()));
      });
    } else {
      emit(NewsGetsportsSucsessState());
    }
  }

  List<dynamic> science = [];
  void Getscience() {
    emit(NewsGetscienceLoadingState());
    if (science.length == 0) {
      DioHelper.GetHomeData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': '132a7f037415475c89622a9807e54079',
        },
      ).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetscienceSucsessState());
      }).catchError((erorr) {
        print(erorr.toString());
        emit(NewsGetscienceErorrState(erorr.toString()));
      });
    } else
      (emit(NewsGetscienceSucsessState()));
  }

  List<dynamic> search = [];
  void Getsearch(String value) {
    emit(NewsGetsearchLoadingState());

    DioHelper.GetHomeData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '132a7f037415475c89622a9807e54079',
      },
    ).then((value) {
      search = value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetsearchSucsessState());
    }).catchError((erorr) {
      print(erorr.toString());
      emit(NewsGetsearchErorrState(erorr.toString()));
    });
  }
}
