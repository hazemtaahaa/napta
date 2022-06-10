import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:napta/shared/cubit/cubit.dart';

class DioHelper {
  static Dio dio;
  static Dio diolog;

  static String Token;

  static init() {
    // dio = Dio(BaseOptions(
    //     baseUrl: 'https://5ra.azurewebsites.net/',
    //     receiveDataWhenStatusError: true,
    //     headers: {'Content-Type': 'application/json',
    //       'Authorization':'bearer SBeFfsaqPBS8CeEAfWMiL1iYKJJXqXFbGt56whSgchxknHLrc7PHGRaYWG1J0rZ4nJeBzIoGVWXUqAKkuhzS-cF5658d6N5asUJ1GEQHljOtY2NkaG08Eg-JLy912xLKD5kmLr47yH-B9J64XHazRFONDbH0_dxLWR4xcv_2YUiReaNPJLspSCjmoiADkS8E6kObI9aqh_rSzBDWtHZTHwYcX5uiYIHbpJhF4pr-sblT2C9LhjChvQqSNjqK_HbUM2HThiAgqSe5mwA63Yl-CzmirTgOCjXcFLVR9Gfuqbf30_k9ebGMlen40pDDxNYGtPwf8MMuK32_z21VyYg89rO6pog2Ccs9ps4GfGxG3Sk'
    //     }));
    diolog = Dio(BaseOptions(
        baseUrl: 'https://5ra.azurewebsites.net/',
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}));
  }

  static void DoSomething() {
    print('Token from dio helper $Token');

    dio = Dio(BaseOptions(
        baseUrl: 'https://5ra.azurewebsites.net/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'bearer $Token'
        }));
  }

  static Future<Response> getData({
    @required String url,
    //@required Map<String, dynamic> query,
  }) async {
    return await dio.get(url); //, queryParameters: query);
  }

  static Future<Response> postData({
    @required String url,
    dynamic query,
    @required Map<String, dynamic> data,
  }) async {
    return await diolog.post(url, data: data, queryParameters: query);
  }

  static Future<Response> post({
    @required String url,
    dynamic query,
    @required Map<String, dynamic> data,
  }) async {
    return await dio.post(url, data: data, queryParameters: query);
  }


  static Future<Response> postPlant({
    @required String url,
    dynamic query,
    @required List<Map<String, dynamic>> data,
  }) async {
    return await dio.post(url, data: data, queryParameters: query);
  }

}
