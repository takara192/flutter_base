import 'package:base_bbs/shared/exceptions/app_exception.dart';
import 'package:dartz/dartz.dart';

abstract class MainDomain {
  Future<Either<AppException, bool>> loadSuccess(bool isSuccess);
}

