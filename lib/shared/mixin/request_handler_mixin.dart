import 'package:base_bbs/domain/base/base_request.dart';
import 'package:base_bbs/domain/base/base_response.dart';
import 'package:base_bbs/shared/exceptions/app_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../utils/log_utils.dart';

mixin RequestHandlerMixin {
  Future<Either<AppException, T>> handleRequest<L extends BaseRequest ,T extends BaseResponse>(
      {
    required Future<T> Function(L) requestHandler,
    required L request,
  }) async {
    try {
      final result = await requestHandler(request);
      return right(result);
    } on DioException catch (e) {
      Log.e(e.toString());
      return left(e.toAppException());
    }
  }
}
