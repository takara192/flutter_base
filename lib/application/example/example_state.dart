part of 'example_cubit.dart';

@freezed
class ExampleState extends BaseCubitState with _$ExampleState {
  const factory ExampleState({
    @Default([]) List<Post> listExample,
}) = _ExampleState;
}
