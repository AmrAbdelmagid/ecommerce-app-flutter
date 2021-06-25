import 'package:dio/dio.dart';


class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
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
    dio!.options.headers = {
      'Content-Type' : 'application/json',
      'lang' : lang,
      'Authorization' : token ?? '',
    };
    return await dio!.get(
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
    dio!.options.headers = {
      'Content-Type' : 'application/json',
      'lang' : lang,
      'Authorization' : token ?? '',
    };
    return await dio!.post(
      pathUrl,
      data: data ,
      queryParameters: query,
    );
  }
}
