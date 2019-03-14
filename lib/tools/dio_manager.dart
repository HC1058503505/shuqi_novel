import 'package:dio/dio.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';

class DioManager {
  Dio _dio;
  // 私有构造函数
  DioManager._internal(){
    BaseOptions options = BaseOptions(
      baseUrl: "http://www.shuqi.com/",
      receiveTimeout: 3000,
      connectTimeout: 10000,
      contentType: ContentType.json
    );
    _dio = Dio(options);
  }

  // 保存单例
  static DioManager singleton = DioManager._internal();

  // 工厂构造函数
  factory DioManager() => singleton;

  Future<dynamic> get({url, pragmas}) async {
    var response = await rootBundle.loadString("lib/mock/$url.json");
    var responseJSON = json.decode(response);
    return responseJSON["data"];
  }
}
