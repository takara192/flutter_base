import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException {
  const factory AppException({
    required String message,
    @Default(null) int? statusCode,
  }) = _AppException;

}

extension AppExceptionExtension on AppException {
  String get errorMessage => message;
}

extension DioExceptionX on DioException {
  AppException toAppException() {
    return AppException(
      message: response?.data['message'] ?? message,
      statusCode: response?.statusCode,
    );
  }
}