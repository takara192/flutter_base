import 'package:base_bbs/application/app/app_cubit.dart';
import 'package:base_bbs/application/base/base_state.dart';
import 'package:base_bbs/application/common/common_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/base/base_request.dart';
import '../../domain/base/base_response.dart';
import '../../shared/exceptions/app_exception.dart';
import '../../shared/utils/log_utils.dart';

abstract class BaseCubit<S extends BaseCubitState> extends Cubit<S> {
  BaseCubit(super.initialState);

  late final AppCubit appCubit;
  late final CommonCubit commonCubit;

  @override
  void emit(S state) {
    if (!isClosed) {
      super.emit(state);
    } else {
      Log.e('Cannot add new event $state because $runtimeType was closed');
    }
  }

  void showLoading(Widget? loadingWidget) {
    commonCubit.onLoadingEmitted(
      isLoading: true,
      loadingWidget: loadingWidget,
    );
  }

  void showError(AppException exception, bool handleRetry,
      Future<void> Function()? onRetry) {
    commonCubit.onExceptionEmitted(exception, onRetry, handleRetry);
  }

  void hideLoading() {
    commonCubit.onLoadingEmitted(isLoading: false);
  }

  Future runAsyncTask<L extends BaseRequest, T extends BaseResponse>({
    required Future<Either<AppException, T>> Function(L) action,
    Future<void> Function()? doOnRetry,
    Future<void> Function(AppException)? doOnError,
    Future<void> Function()? doOnSubscribe,
    Future<void> Function()? doOnSuccessOrError,
    Future<void> Function()? doOnEventCompleted,
    Future<void> Function(T)? doOnSuccess,
    required L request,
    bool handleLoading = true,
    bool handleError = true,
    bool handleRetry = false,
    bool Function(AppException)? forceHandleError,
    String? overrideErrorMessage,
    Widget? loadingWidget,
  }) async {
    await doOnSubscribe?.call();

    if(loadingWidget != null && !handleLoading) {
      throw Exception('loadingWidget is not null but handleLoading is false');
    }

    if (handleLoading) {
      showLoading(loadingWidget);
    }

    final result = await action(request);

    if (handleLoading) {
      hideLoading();
    }

    result.fold(
      (appException) async {
        if (handleError) {
          showError(appException, handleRetry, doOnRetry);
        }
        await doOnError?.call(appException);
      },
      (data) async {
        await doOnSuccess?.call(data);
      },
    );
    await doOnSuccessOrError?.call();

    await doOnEventCompleted?.call();
  }
}
