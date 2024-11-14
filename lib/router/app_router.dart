import 'package:auto_route/auto_route.dart';
import 'package:base_bbs/router/app_router.gr.dart';
import 'package:injectable/injectable.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
@LazySingleton()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: RMain.page, initial: true),
      ];
}
