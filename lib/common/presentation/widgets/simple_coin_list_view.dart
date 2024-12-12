import 'package:crypto_currency/utils/color_extensions.dart';
import 'package:crypto_currency/widgets/crypto_icon.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class SimpleCoinListView extends StatelessWidget {
  SimpleCoinListView({super.key, required this.name, required this.coinName, this.onTap});

  final String name;
  final String coinName;
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
            SizedBox(width: 64, height: 64, child: CryptoIcon(name: name)),
            const Gap(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: theme.textTheme.labelLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Gap(4),
                Text(
                  coinName,
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
