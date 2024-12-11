// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:crypto_currency/data/database/entities/crypto_coin.dart' as _i9;
import 'package:crypto_currency/features/account/view/account_screen.dart'
    as _i1;
import 'package:crypto_currency/features/crypto_all_list/view/crypto_all_list_screen.dart'
    as _i2;
import 'package:crypto_currency/features/crypto_list/view/crypto_list_screen.dart'
    as _i3;
import 'package:crypto_currency/features/home/view/home_screen.dart' as _i4;
import 'package:crypto_currency/features/news/view/news_screen.dart' as _i5;
import 'package:crypto_currency/features/one_coin_details/view/one_coin_details_screen.dart'
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
/// [_i2.CryptoAllListScreen]
class CryptoAllListRoute extends _i7.PageRouteInfo<void> {
  const CryptoAllListRoute({List<_i7.PageRouteInfo>? children})
      : super(
          CryptoAllListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CryptoAllListRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.CryptoAllListScreen();
    },
  );
}

/// generated route for
/// [_i3.CryptoListScreen]
class CryptoListRoute extends _i7.PageRouteInfo<void> {
  const CryptoListRoute({List<_i7.PageRouteInfo>? children})
      : super(
          CryptoListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CryptoListRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.CryptoListScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
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
      return const _i4.HomeScreen();
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
    required _i9.CryptoCoin coin,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          OneCoinDetailRoute.name,
          args: OneCoinDetailRouteArgs(
            key: key,
            coin: coin,
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
        coin: args.coin,
      );
    },
  );
}

class OneCoinDetailRouteArgs {
  const OneCoinDetailRouteArgs({
    this.key,
    required this.coin,
  });

  final _i8.Key? key;

  final _i9.CryptoCoin coin;

  @override
  String toString() {
    return 'OneCoinDetailRouteArgs{key: $key, coin: $coin}';
  }
}
