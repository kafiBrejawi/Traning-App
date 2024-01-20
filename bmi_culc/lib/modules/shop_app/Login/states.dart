import 'package:bmi_culc/models/shop_app/login.dart';

abstract class ShopLoginState {}

class ShopLoginInitialState extends ShopLoginState {}

class ShopLoginSucsessState extends ShopLoginState {
  final ShopLoginModel loginmodel;

  ShopLoginSucsessState(this.loginmodel);
}

class ShopLoginLoadingState extends ShopLoginState {}

class ShopLoginErrorState extends ShopLoginState {
  final String error;

  ShopLoginErrorState(this.error);
}
