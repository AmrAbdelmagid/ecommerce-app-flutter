import 'package:dio/dio.dart';


class DioHelper {
  static Dio? _dio;

  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String pathUrl,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    _dio!.options.headers = {
      'Content-Type' : 'application/json',
      'lang' : lang,
      'Authorization' : token ?? '',
    };
    return await _dio!.get(
      pathUrl,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String pathUrl,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    _dio!.options.headers = {
      'Content-Type' : 'application/json',
      'lang' : lang,
      'Authorization' : token ?? '',
    };
    return await _dio!.post(
      pathUrl,
      data: data ,
      queryParameters: query,
    );
  }

  static Future<Response> putData({
    required String pathUrl,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    _dio!.options.headers = {
      'Content-Type' : 'application/json',
      'lang' : lang,
      'Authorization' : token ?? '',
    };
    return await _dio!.put(
      pathUrl,
      data: data ,
      queryParameters: query,
    );
  }
}
