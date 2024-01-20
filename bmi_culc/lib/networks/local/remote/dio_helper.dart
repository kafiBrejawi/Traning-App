// ignore_for_file: non_constant_identifier_names

import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:bmi_culc/modules/home_app/done_tasks/login/login.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/ ',
      receiveDataWhenStatusError: true,
      connectTimeout: 50 * 1000,
      receiveTimeout: 50 * 1000,
    ));
  }

  static Future<Response> GetHomeData(
      {required String url,
      dynamic query,
      String lang = 'en',
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authrization': token ?? '',
    };

    return await dio.get("https://student.valuxapps.com/api/home",
        queryParameters: query);
  }

  static Future<Response> GetCategoreisData({
    required String url,
    dynamic query,
    String lang = 'en',
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
    };

    return await dio.get("https://student.valuxapps.com/api/categories",
        queryParameters: query);
  }

  static Future<Response> PostLoginData({
    required String url,
    dynamic query,
    required dynamic data,
    String lang = 'ar',
  }) async {
    dio.options.headers = {
      'lang': lang,
    };
    return await dio.post(
      "https://student.valuxapps.com/api/login",
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> PostRegistData({
    required String url,
    dynamic query,
    required dynamic data,
    String lang = 'ar',
  }) async {
    dio.options.headers = {
      'lang': lang,
    };
    return await dio.post(
      "https://student.valuxapps.com/api/register",
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> PostFavoritesData({
    required String url,
    dynamic query,
    required dynamic data,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json'
    };
    return await dio.post(
      "https://student.valuxapps.com/api/favorites",
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> GetUserData({
    required String url,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    return await dio.get(
      "https://student.valuxapps.com/api/profile",
    );
  }
}
