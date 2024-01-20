import 'package:bmi_culc/models/shop_app/login.dart';

abstract class ShopRegistState {}

class ShopRegistInitialState extends ShopRegistState {}

class ShopRegistSucsessState extends ShopRegistState {
  final ShopLoginModel loginmodel;

  ShopRegistSucsessState(this.loginmodel);
}

class ShopRegistLoadingState extends ShopRegistState {}

class ShopRegistErrorState extends ShopRegistState {
  final String error;

  ShopRegistErrorState(this.error);
}
