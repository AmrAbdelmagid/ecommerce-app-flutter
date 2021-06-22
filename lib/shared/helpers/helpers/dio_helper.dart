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
  }) async {
    return await dio!.get(
      pathUrl,
      queryParameters: query,
    );
  }
}
