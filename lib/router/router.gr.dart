// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:crypto_currency/features/home/view/home_screen.dart' as _i1;
import 'package:crypto_currency/features/one_coin_details/view/one_coin_details_screen.dart'
    as _i2;
import 'package:crypto_currency/repositories/crypto_compare/models/crypto_coin.dart'
    as _i5;
import 'package:flutter/material.dart' as _i4;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.OneCoinDetailScreen]
class OneCoinDetailRoute extends _i3.PageRouteInfo<OneCoinDetailRouteArgs> {
  OneCoinDetailRoute({
    _i4.Key? key,
    required _i5.CryptoCoin coin,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          OneCoinDetailRoute.name,
          args: OneCoinDetailRouteArgs(
            key: key,
            coin: coin,
          ),
          initialChildren: children,
        );

  static const String name = 'OneCoinDetailRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OneCoinDetailRouteArgs>();
      return _i2.OneCoinDetailScreen(
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

  final _i4.Key? key;

  final _i5.CryptoCoin coin;

  @override
  String toString() {
    return 'OneCoinDetailRouteArgs{key: $key, coin: $coin}';
  }
}
