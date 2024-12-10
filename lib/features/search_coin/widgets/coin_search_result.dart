import 'dart:ffi';

import 'package:crypto_currency/repositories/crypto_compare/models/crypto_coin.dart';
import 'package:crypto_currency/utils/color_extensions.dart';
import 'package:crypto_currency/widgets/crypto_icon.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class CoinSearchResult extends StatelessWidget {
  CoinSearchResult({super.key, required this.coin, this.onTap});

  final CryptoCoin coin;
  Function(CryptoCoin)? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          onTap?.call(coin);
        },
        child: Row(
          children: [
            const Gap(20),
            SizedBox(width: 64, height: 64, child: CryptoIcon(name: coin.name)),
            const Gap(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coin.name,
                  style: theme.textTheme.labelLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Gap(4),
                Text(
                  coin.coinName,
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: HexColor.fromHex('#727272')),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
