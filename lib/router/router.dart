import 'package:auto_route/auto_route.dart';
import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/', children: [
          AutoRoute(page: CryptoListRoute.page),
          AutoRoute(page: CryptoAllListRoute.page),
          AutoRoute(page: NewsRoute.page),
          AutoRoute(page: AccountRoute.page),
        ]),
        AutoRoute(page: OneCoinDetailRoute.page)
      ];
}
