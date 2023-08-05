
import 'package:dio/dio.dart';
import 'package:fake_store/src/data/services/service.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjections implements Bindings {
  @override
  Future<void> dependencies() async {
    final encryptedSharedPreferences = await Get.putAsync(_encryptedSharedPreferences);
    final dio = await Get.putAsync(() => _dio(encryptedSharedPreferences));
    Get.put(Services(dio));
    Get.put(Services(dio));
  }

  Future<Dio> _dio(EncryptedSharedPreferences encryptedSharedPreferences) async {
    var dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));
      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          String token = await prefs.getString("token")??"";
          options.headers = {
            "Authorization": "Bearer $token",
            ...options.headers,
          };
          handler.next(options);
        },
        onError: (e, handler) async {
          if (e.response?.statusCode == HttpStatus.unauthorized) {
            await encryptedSharedPreferences.clear();
          }
          handler.next(e);
        },
      ));
      return dio;

    }



  Future<EncryptedSharedPreferences> _encryptedSharedPreferences() async {
    var shared = EncryptedSharedPreferences(
      mode: AESMode.sic,
      randomKeyKey: 'eK#1@1713#ePro',
      randomKeyListKey: 'eK#2@1713#ePro',
    );
    return shared;
  }
}
