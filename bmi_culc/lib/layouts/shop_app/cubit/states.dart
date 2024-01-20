import 'package:bmi_culc/models/shop_app/login.dart';

abstract class ShopState {}

class ShopInitialState extends ShopState {}

class ShopChangeBottommNavState extends ShopState {}

class ShopLoadingDataState extends ShopState {}

class ShopErorrDataState extends ShopState {}

class ShopSucsessDataState extends ShopState {}

class ShopSucsessCategoreisState extends ShopState {}

class ShopErorrCategoreisState extends ShopState {}

class ShopErorrChangeFavoriteState extends ShopState {}

class ShopSucsessChangeFavoriteState extends ShopState {}

class ShopSucsessUserState extends ShopState {
  final ShopLoginModel loginModel;

  ShopSucsessUserState(this.loginModel);
}

class ShopLoadingUserState extends ShopState {}

class ShopErorrUserState extends ShopState {}
