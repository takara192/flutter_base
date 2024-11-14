import 'package:base_bbs/domain/base/base_request.dart';
import 'package:base_bbs/domain/example/example_repo.dart';
import 'package:base_bbs/domain/example/model/example_response.dart';
import 'package:base_bbs/shared/exceptions/app_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../shared/mixin/request_handler_mixin.dart';
import 'example_service.dart';

@LazySingleton(as: ExampleRepo)
class ExampleRepoImpl with RequestHandlerMixin implements ExampleRepo {
  final ExampleService _exampleService;


  ExampleRepoImpl(this._exampleService);

  @override
  Future<Either<AppException, ExampleResponse>> getPosts(NoParamRequest request) async {
    //Cach 1
    try {
      final response = await _exampleService.getPosts(request);

      final result = ExampleResponse(
        listPost: response,
      );

      return right(result);

    } on DioException catch (e) {
      return left(e.toAppException());
    }
    //Cach 2:
    // return handleRequest(
    //   requestHandler: _exampleService.getPosts,
    //   request: request,
    // );

  }

}