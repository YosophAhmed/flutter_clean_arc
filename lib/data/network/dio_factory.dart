import 'package:clean_arc_project/app/app_prefs.dart';
import 'package:clean_arc_project/app/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String appJson = 'application/json';
const String contentType = 'content-type';
const String accept = 'accept';
const String auth = 'authorization';
const String defaultLanguage = 'language';

class DioFactory {
  DioFactory(
    this._appPrefs,
  );

  final AppPrefs _appPrefs;

  Future<Dio> getDio() async {
    Dio dio = Dio();

    String language = await _appPrefs.getAppLanguage();

    Map<String, String> headers = {
      contentType: appJson,
      accept: appJson,
      auth: Constants.token,
      defaultLanguage: language,
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      receiveTimeout: const Duration(
        milliseconds: Constants.apiTimeOut,
      ),
      sendTimeout: const Duration(
        milliseconds: Constants.apiTimeOut,
      ),
    );

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }

    return dio;
  }
}
