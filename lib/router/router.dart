import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:crypto_currency/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  // TODO: implement defaultRouteType
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/'),
        AutoRoute(page: OneCoinDetailRoute.page)
      ];
}
