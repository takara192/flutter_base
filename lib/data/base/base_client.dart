
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../example/example_service.dart';

@module
abstract class ApiModule {
  // @lazySingleton
  // ApiClient provideApiClient(Dio dio){
  //   return ApiClient(dio);
  // }

  @lazySingleton
  ExampleService provideExampleService(Dio dio){
    return ExampleService(dio);
  }
}

