import 'package:base_bbs/application/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../shared/exceptions/app_exception.dart';
import '../base/base_cubit.dart';

part 'common_cubit.freezed.dart';
part 'common_state.dart';

@Injectable()
class CommonCubit extends BaseCubit<CommonState> {
  CommonCubit() : super(const CommonState.initial());

  void onLoadingEmitted({required bool isLoading, Widget? loadingWidget}) {
    emit(CommonState.loading(isLoading: isLoading, loadingWidget: loadingWidget));
  }

  void onExceptionEmitted(AppException exception, Future<void> Function()? onRetry, bool handleError) {
    emit(CommonState.error(exception: exception, handleError: handleError, onRetry: onRetry));
  }
}
