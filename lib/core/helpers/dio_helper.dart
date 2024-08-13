import 'package:dio/dio.dart';

class DioHelper {
  static final DioHelper _instance = DioHelper._internal();
  static Dio? _dio;
  factory DioHelper() {
    return _instance;
  }
  DioHelper._internal() {
    _dio ??= Dio(
      BaseOptions(connectTimeout: Duration(seconds: 15)),
    );
    _dio!.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
    addTokenInterceptor();
  }
  void addTokenInterceptor() async {
    // final
  }
  Dio get dio => _dio!;
}
