import 'package:crypto_currency/features/crypto_coin/view/crypto_coin_screen.dart';
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
                      style: theme.textTheme.bodyLarge,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$ ${coin.priceInUSD.toStringAsFixed(coin.priceInUSD > 1 ? 3 : 6)}',
                      selectionColor: Colors.black,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${coin.changePrcDay > 0 ? '+' : '-'} ${coin.changePrcDay.toStringAsFixed(3)}",
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
        Navigator.of(context).pushNamed(CryptoCoinScreen.routeName,
            arguments: CryptoCoinScreenArguments(coin));
      },
    );
  }

  // ListTile(
  //   title: Text(
  //     coin.name,
  //     style: theme.textTheme.titleMedium!,
  //   ),
  //   subtitle: Text(
  //     "${coin.priceInUSD} \$",
  //     style: theme.textTheme.bodyMedium,
  //   ),
  //   leading: Image.network(coin.imageUrl),
  //   trailing: const Icon(Icons.arrow_forward),
  //   onTap: () {
  //     Navigator.of(context).pushNamed(CryptoCoinScreen.routeName,
  //         arguments: CryptoCoinScreenArguments(coin));
  //   },
  // );
}
