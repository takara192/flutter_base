import 'package:base_bbs/router/app_router.gr.dart';
import 'package:base_bbs/shared/constants/api_constants.dart';
import 'package:base_bbs/shared/constants/shared_preference_constants.dart';
import 'package:base_bbs/shared/local_storage/shared_preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../common/di/di.dart';
import '../../router/app_router.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      )
    );

    dio.interceptors.add(
        PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90,
        )
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? token = SharedPreferencesManager.getString(SharedPreferenceKey.keyAccessToken);

          if(token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          if(e.response?.statusCode == 401) {
            final appRouter = getIt.get<AppRouter>();
            appRouter.replaceAll([const RLogin()]);
          }
          return handler.next(e);
        },
      )
    );

    return dio;
  }
}