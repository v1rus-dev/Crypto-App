import 'package:crypto_currency/features/main_coins_info/domain/entities/coin_info.dart';
import 'package:crypto_currency/utils/color_extensions.dart';
import 'package:crypto_currency/widgets/crypto_icon.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class CoinInfoItem extends StatelessWidget {
  CoinInfoItem({super.key, required this.coinInfo, this.onTap});

  final CoinInfo coinInfo;
  Function? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          onTap?.call();
        },
        child: Row(
          children: [
            const Gap(20),
            SizedBox(
                width: 64, height: 64, child: CryptoIcon(name: coinInfo.name)),
            const Gap(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coinInfo.name,
                  style: theme.textTheme.labelLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Gap(4),
                Text(
                  coinInfo.coinName,
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
