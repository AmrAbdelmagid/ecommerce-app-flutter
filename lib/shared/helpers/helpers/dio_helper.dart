import 'package:dio/dio.dart';


class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type' : 'application/json',
        }
      ),
    );
  }

  static Future<Response> getData({
    required String pathUrl,
    required Map<String, dynamic> query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
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
