import 'package:base_bbs/application/base/base_state.dart';
import 'package:base_bbs/domain/base/base_request.dart';
import 'package:base_bbs/domain/example/example_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/example/model/example_response.dart';
import '../base/base_cubit.dart';

part 'example_state.dart';
part 'example_cubit.freezed.dart';

@injectable
class ExampleCubit extends BaseCubit<ExampleState> {
  ExampleCubit(this._exampleRepo) : super(const ExampleState());

  final ExampleRepo _exampleRepo;


  Future getPosts() async {
    runAsyncTask(
      action: _exampleRepo.getPosts,
      request: NoParamRequest(),
      doOnSuccess: (response) async {
        emit(state.copyWith(listExample: response.listPost));
      },
    );
  }

}
