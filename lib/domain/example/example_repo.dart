import 'package:base_bbs/domain/base/base_request.dart';
import 'package:base_bbs/domain/example/model/example_response.dart';
import 'package:base_bbs/shared/exceptions/app_exception.dart';
import 'package:dartz/dartz.dart';

abstract class ExampleRepo {
  Future<Either<AppException, ExampleResponse>> getPosts(NoParamRequest request);
}