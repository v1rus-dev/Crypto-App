import 'package:crypto_currency/features/one_coin_details/view/one_coin_details_screen.dart';
import 'package:crypto_currency/repositories/crypto_compare/models/crypto_coin.dart';
import 'package:crypto_currency/widgets/crypto_icon.dart';
import 'package:flutter/material.dart';

class CryptoItem extends StatelessWidget {
  const CryptoItem({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
          padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
          child: Row(
            children: [
              SizedBox(
                width: 36,
                height: 36,
                child: CryptoIcon(name: coin.name, imageUri: coin.imageUrl),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coin.name,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
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
              )
            ],
          )),
      onTap: () {
        Navigator.of(context).pushNamed(OneCoinDetailScreen.routeName,
            arguments: OneCoinDetailScreenArguments(coin));
      },
    );
  }
}
