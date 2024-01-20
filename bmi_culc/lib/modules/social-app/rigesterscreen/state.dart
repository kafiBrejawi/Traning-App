import 'package:bmi_culc/models/shop_app/login.dart';

abstract class SocialRegistState {}

class SocialRegistInitialState extends SocialRegistState {}

class SocialRegistSucsessState extends SocialRegistState {
  //final SocialLoginModel loginmodel;

//SocialRegistSucsessState(this.loginmodel);
}

class SocialRegistLoadingState extends SocialRegistState {}

class SocialRegistErrorState extends SocialRegistState {
  final String error;

  SocialRegistErrorState(this.error);
}

class SocialCreateUserState extends SocialRegistState {}

class SocialErrorCreateUserState extends SocialRegistState {
  final String error;

  SocialErrorCreateUserState(this.error);
}

class RegistPasswordVisibility extends SocialRegistState {}
