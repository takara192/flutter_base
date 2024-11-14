part of 'common_cubit.dart';

@freezed
class CommonState extends BaseCubitState with _$CommonState {
  const factory CommonState.initial() = _Initial;
  const factory CommonState.error({
    required AppException exception,
    @Default(false) handleError,
    @Default(null) Future<void> Function()? onRetry,
  }) = _Error;
  const factory CommonState.loading({
    required bool isLoading,
    @Default(null) Widget? loadingWidget,
}) = _Loading;
}
