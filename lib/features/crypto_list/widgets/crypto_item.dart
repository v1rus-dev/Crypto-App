import 'package:crypto_currency/features/one_coin_details/view/one_coin_details_screen.dart';
import 'package:crypto_currency/data/database/entities/crypto_coin.dart';
import 'package:crypto_currency/widgets/crypto_icon.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CryptoItem extends StatelessWidget {
  const CryptoItem({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Material(
      child: InkWell(
        onTap: () {
          // Navigator.of(context).pushNamed(OneCoinDetailScreen.routeName,
          //     arguments: OneCoinDetailScreenArguments(coin));
        },
        child: Container(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              children: [
                SizedBox(
                  width: 56,
                  height: 56,
                  child: CryptoIcon(name: coin.name),
                ),
                const Gap(20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coin.name,
                      style: theme.textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$',
                      selectionColor: Colors.black,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${coin.changePrcDay > 0 ? '+' : ''}${coin.changePrcDay.toStringAsFixed(3)}",
                      style: theme.textTheme.bodySmall?.copyWith(
                          color: coin.changePrcDay > 0
                              ? Colors.green
                              : Colors.red),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
