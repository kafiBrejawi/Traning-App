import 'package:bmi_culc/models/shop_app/login.dart';
import 'package:bmi_culc/modules/shop_app/Login/states.dart';
import 'package:bmi_culc/networks/local/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../networks/endpoint.dart';

class ShopLoginCubit extends Cubit<ShopLoginState> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  void userlogin({
    required String email,
    required String password,
    ShopLoginModel? loginmodel,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.PostLoginData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      loginmodel = ShopLoginModel.fromJson(value.data);
      print(loginmodel!.status);
      emit(ShopLoginSucsessState(loginmodel!));
    }).catchError((erorr) {
      print(erorr.toString());
      emit(ShopLoginErrorState(erorr.toString()));
    });
  }
}
