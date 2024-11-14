import 'package:base_bbs/presentation/base/base_page_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../base/base_cubit.dart';
import '../base/base_state.dart';

part 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit() : super(LoginState());

}
