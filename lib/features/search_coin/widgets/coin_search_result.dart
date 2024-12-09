import 'dart:ffi';

import 'package:crypto_currency/repositories/crypto_compare/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class CoinSearchResult extends StatelessWidget {
  CoinSearchResult({super.key, required this.coin, this.onTap});

  final CryptoCoin coin;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          onTap?.call();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [const Gap(20), Text(coin.coinName)],
          ),
        ),
      ),
    );
  }
}
