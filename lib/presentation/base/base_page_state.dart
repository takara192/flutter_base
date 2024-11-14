import 'package:base_bbs/application/app/app_cubit.dart';
import 'package:base_bbs/application/base/base_cubit.dart';
import 'package:base_bbs/application/common/common_cubit.dart';
import 'package:base_bbs/common/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

abstract class BasePageState<T extends StatefulWidget, B extends BaseCubit> extends State<T> {
  final AppCubit appCubit = getIt.get<AppCubit>();

  late final CommonCubit commonCubit = getIt.get<CommonCubit>()
    ..appCubit = appCubit;

  late final B cubit = getIt.get<B>()
    ..appCubit = appCubit
    ..commonCubit = commonCubit;

  Widget buildPage(BuildContext context);

  Widget loadingWidget = SpinKitSpinningLines(
    color: Colors.white,
    size: 50.0.sp,
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => commonCubit,
        ),
        BlocProvider(
          create: (context) => cubit,
        ),
      ],
      child: BlocListener<CommonCubit, CommonState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (exception, handleRetry, doOnRetry) {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text: exception.message,
                title: exception.statusCode?.toString() ?? 'Oops...',
                confirmBtnText: 'OK',
                cancelBtnText: 'Retry',
                onCancelBtnTap: () async {
                  if (handleRetry) {
                    Navigator.of(context).pop();
                    await doOnRetry?.call();
                  }
                },
                showCancelBtn: handleRetry,
              );
            },
            loading: (isLoading, loading) {
              if (isLoading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return PopScope(
                      canPop: false,
                      child: Center(
                        child: loading ?? loadingWidget,
                      ),
                    );
                  },
                );
              } else {
                Navigator.of(context).pop();
              }
            },
          );
        },
        child:  buildPage(context),
      ),
    );
  }
}
