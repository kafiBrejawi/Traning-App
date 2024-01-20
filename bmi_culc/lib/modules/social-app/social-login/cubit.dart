import 'package:bmi_culc/models/shop_app/login.dart';
import 'package:bmi_culc/modules/shop_app/Login/states.dart';
import 'package:bmi_culc/modules/social-app/social-login/state.dart';
import 'package:bmi_culc/networks/local/remote/dio_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../networks/endpoint.dart';

class socialLoginCubit extends Cubit<socialLoginState> {
  socialLoginCubit() : super(socialLoginInitialState());

  static socialLoginCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();

  void userlogin({
    required String email,
    required String password,
  }) {
    emit(socialLoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(socialLoginSucsessState(value.user!.uid));
    })
      ..catchError((erorr) {
        emit(socialLoginErrorState(erorr.toString()));
      });
  }
}
