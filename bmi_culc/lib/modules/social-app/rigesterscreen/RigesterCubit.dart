import 'package:bmi_culc/models/shop_app/login.dart';
import 'package:bmi_culc/modules/shop_app/Login/states.dart';
import 'package:bmi_culc/modules/shop_app/register/states.dart';
import 'package:bmi_culc/modules/social-app/rigesterscreen/state.dart';
import 'package:bmi_culc/networks/local/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../models/SocialApp/users.dart';
import '../../../networks/endpoint.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SocialRegistCubit extends Cubit<SocialRegistState> {
  SocialRegistCubit() : super(SocialRegistInitialState());

  static SocialRegistCubit get(context) => BlocProvider.of(context);

  void userRegist({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) {
    emit(SocialRegistLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) => {
              userRegistCreate(
                  uid: value.user!.uid, phone: phone, email: email, name: name),
            })
        .catchError((error) {
      print(error.toString());
      emit(SocialRegistErrorState(error.toString()));
    });
  }

  CreateUserModel? model;

  void userRegistCreate({
    required String email,
    required String phone,
    required String name,
    required String uid,
  }) {
    CreateUserModel model = CreateUserModel(
        name: name,
        phone: phone,
        email: email,
        uid: uid,
        bio: 'write your bio',
        image:
            'https://img.freepik.com/free-photo/close-up-young-handsome-man-isolated_273609-35827.jpg?t=st=1683217648~exp=1683218248~hmac=ab16b600def02c679ba80b34c1550ab7cddbbe8808a24e15eb0a393d510d646d');
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(model.tomap())
        .then((value) {
      emit(SocialCreateUserState());
    }).catchError((error) {
      emit(SocialErrorCreateUserState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(RegistPasswordVisibility());
  }
}
