import 'package:dio/dio.dart';
import 'package:shop_app/shared/network/remote/end_points.dart';

class DioHelper {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: baseURL,
      receiveDataWhenStatusError: true,
    ),
  );

  // static Dio? dio;
  //
  // static init() {
  //   dio = Dio(
  //     BaseOptions(
  //       baseUrl: 'https://student.valuxapps.com/api/',
  //       receiveDataWhenStatusError: true,
  //     ),
  //   );
  // }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options = BaseOptions(headers: {
      'Content_Type': 'application/json',
      "lang": lang,
      "Authorization": token ?? '',
    });
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options = BaseOptions(headers: {
      'Content_Type': 'application/json',
      "lang": lang,
      "Authorization": token ?? '',
    });
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options = BaseOptions(headers: {
      'Content_Type': 'application/json',
      "lang": lang,
      "Authorization": token ?? '',
    });
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options = BaseOptions(headers: {
      'Content_Type': 'application/json',
      "lang": lang,
      "Authorization": token ?? '',
    });
    return await dio.delete(
      url,
      queryParameters: query,
    );
  }
}
