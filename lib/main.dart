import 'package:base_bbs/router/app_router.dart';
import 'package:base_bbs/shared/constants/device_constants.dart';
import 'package:base_bbs/shared/local_storage/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'common/di/di.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _beforeRunApp();

  runApp(MyApp());
}

Future _beforeRunApp() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  configureDependencies();
  SharedPreferencesManager.getInstance();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = getIt.get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        DeviceConstants.designDeviceWidth,
        DeviceConstants.designDeviceHeight,
      ),
      minTextAdapt: true,
      child: MaterialApp.router(
        locale:  const Locale('vi'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'BBS App',
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
