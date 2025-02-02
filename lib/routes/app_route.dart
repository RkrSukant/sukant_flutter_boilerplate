
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sukant_flutter_boilerplate/routes/router_paths.dart';

import 'app_route.gr.dart';

final appRouterProvider = Provider((ref) => AppRouter());

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter{

  @override
  RouteType get defaultRouteType =>
      const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: Paths.exampleScreen,
      page: ExampleRoute.page,
      initial: true,
    ),
  ];
}