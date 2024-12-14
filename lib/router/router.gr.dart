// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:crypto_currency/features/account/view/account_screen.dart'
    as _i1;
import 'package:crypto_currency/features/all_list_coins/presentation/view/all_list_coins_screen.dart'
    as _i2;
import 'package:crypto_currency/features/home/view/home_screen.dart' as _i3;
import 'package:crypto_currency/features/main_coins_info/presentation/view/main_coins_info_screen.dart'
    as _i4;
import 'package:crypto_currency/features/news/view/news_screen.dart' as _i5;
import 'package:crypto_currency/features/one_coin_details/presentation/view/one_coin_details_screen.dart'
    as _i6;
import 'package:flutter/material.dart' as _i8;

/// generated route for
/// [_i1.AccountScreen]
class AccountRoute extends _i7.PageRouteInfo<void> {
  const AccountRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountScreen();
    },
  );
}

/// generated route for
/// [_i2.AllListCoinsScreen]
class AllListCoinsRoute extends _i7.PageRouteInfo<void> {
  const AllListCoinsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AllListCoinsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllListCoinsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.AllListCoinsScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.MainCoinsInfoScreen]
class MainCoinsInfoRoute extends _i7.PageRouteInfo<void> {
  const MainCoinsInfoRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MainCoinsInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainCoinsInfoRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.MainCoinsInfoScreen();
    },
  );
}

/// generated route for
/// [_i5.NewsScreen]
class NewsRoute extends _i7.PageRouteInfo<void> {
  const NewsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.NewsScreen();
    },
  );
}

/// generated route for
/// [_i6.OneCoinDetailScreen]
class OneCoinDetailRoute extends _i7.PageRouteInfo<OneCoinDetailRouteArgs> {
  OneCoinDetailRoute({
    _i8.Key? key,
    required String coinName,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          OneCoinDetailRoute.name,
          args: OneCoinDetailRouteArgs(
            key: key,
            coinName: coinName,
          ),
          initialChildren: children,
        );

  static const String name = 'OneCoinDetailRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OneCoinDetailRouteArgs>();
      return _i6.OneCoinDetailScreen(
        key: args.key,
        coinName: args.coinName,
      );
    },
  );
}

class OneCoinDetailRouteArgs {
  const OneCoinDetailRouteArgs({
    this.key,
    required this.coinName,
  });

  final _i8.Key? key;

  final String coinName;

  @override
  String toString() {
    return 'OneCoinDetailRouteArgs{key: $key, coinName: $coinName}';
  }
}
