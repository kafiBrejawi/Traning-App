import 'package:bmi_culc/models/shop_app/login.dart';

abstract class socialLoginState {}

class socialLoginInitialState extends socialLoginState {}

class socialLoginSucsessState extends socialLoginState {
  //final ShopLoginModel loginmodel;
  final String uid;
  socialLoginSucsessState(this.uid);
}

class socialLoginLoadingState extends socialLoginState {}

class socialLoginErrorState extends socialLoginState {
  final String error;

  socialLoginErrorState(this.error);
}
