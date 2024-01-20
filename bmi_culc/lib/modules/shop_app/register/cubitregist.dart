import 'package:bmi_culc/models/shop_app/login.dart';
import 'package:bmi_culc/modules/shop_app/Login/states.dart';
import 'package:bmi_culc/modules/shop_app/register/states.dart';
import 'package:bmi_culc/networks/local/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../networks/endpoint.dart';

class ShopRegistCubit extends Cubit<ShopRegistState> {
  ShopRegistCubit() : super(ShopRegistInitialState());

  static ShopRegistCubit get(context) => BlocProvider.of(context);

  void userRegist({
    required String email,
    required String password,
    required String phone,
    required String name,
    ShopLoginModel? loginmodel,
  }) {
    emit(ShopRegistLoadingState());
    DioHelper.PostRegistData(
      url: Register,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print("sadasd");
      print(value.data);
      loginmodel = ShopLoginModel.fromJson(value.data);
      print(loginmodel!.status);
      emit(ShopRegistSucsessState(loginmodel!));
    }).catchError((erorr) {
      print("");
      print(erorr.toString());
      emit(ShopRegistErrorState(erorr.toString()));
    });
  }
}
