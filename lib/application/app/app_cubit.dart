import 'package:base_bbs/application/base/base_state.dart';
import 'package:injectable/injectable.dart';
import '../base/base_cubit.dart';

part 'app_state.dart';

@LazySingleton()
class AppCubit extends BaseCubit<AppState> {
  AppCubit() : super(AppState());

}
