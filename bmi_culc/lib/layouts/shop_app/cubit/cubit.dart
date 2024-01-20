import 'package:bmi_culc/layouts/shop_app/categories/categoreis.dart';
import 'package:bmi_culc/layouts/shop_app/cubit/states.dart';
import 'package:bmi_culc/layouts/shop_app/favorite/favorite.dart';
import 'package:bmi_culc/layouts/shop_app/products/shop_products.dart';
import 'package:bmi_culc/layouts/shop_app/search/shop_search.dart';
import 'package:bmi_culc/layouts/shop_app/settings/shop_settings.dart';
import 'package:bmi_culc/models/shop_app/home/home_model.dart';
import 'package:bmi_culc/models/shop_app/login.dart';
import 'package:bmi_culc/networks/endpoint.dart';
import 'package:bmi_culc/networks/local/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/shop_app/Categoreis/Categoreis_Model.dart';
import '../../../models/shop_app/favorites.dart';
import '../../../shared/components/contstants.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  Map<int, dynamic> favorites = {};

  HomeModel? homeModel;
  void getHomeDate() {
    emit(ShopLoadingDataState());

    DioHelper.GetHomeData(
      url: Home,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      homeModel!.data!.products!.forEach((element) {
        // print(element.id);
        favorites.addAll({element.id: element.inFavorites});
      });
      print(favorites.toString());
      emit(ShopSucsessDataState());
    }).catchError((erorr) {
      print(erorr.toString());
      emit(ShopErorrDataState());
    });
  }

  CategoriesModel? categoriesModel;
  void getCategoreisDate() {
    DioHelper.GetCategoreisData(
      url: Categories,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(ShopSucsessCategoreisState());
    }).catchError((erorr) {
      print(erorr.toString());
      emit(ShopErorrCategoreisState());
    });
  }

  int currentindex = 0;
  List<Widget> bottomscreen = [
    ShopProducts(),
    ShopCate(),
    ShopFave(),
    ShopSettings(),
  ];

  void changeBottom(int index) {
    currentindex = index;

    emit(ShopChangeBottommNavState());
  }

  ChangeFavoritesModel? changefavoritesmodel;
  void changefavorites(int productid) {
    favorites[productid] != favorites[productid];
    emit(ShopSucsessChangeFavoriteState());

    DioHelper.PostFavoritesData(
            url: Favorites, data: {'product_id': productid}, token: token)
        .then((value) {
      changefavoritesmodel = ChangeFavoritesModel.fromJson(value.data);

      emit(ShopSucsessChangeFavoriteState());
    }).catchError((error) {
      emit(ShopErorrChangeFavoriteState());
    });
  }

  ShopLoginModel? usermodel;

  void GetUserData() {
    emit(ShopLoadingUserState());

    DioHelper.GetUserData(url: Profile, token: token).then((value) {
      usermodel = ShopLoginModel.fromJson(value.data);
      print(usermodel!.data!.name);
      emit(ShopSucsessUserState(usermodel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErorrUserState());
    });
  }
}
