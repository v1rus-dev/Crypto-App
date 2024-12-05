import 'package:crypto_currency/features/crypto_coin/view/crypto_coin_screen.dart';
import 'package:crypto_currency/repositories/crypto_compare/models/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoItem extends StatelessWidget {
  const CryptoItem({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child:Container(
            padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.network(coin.imageUrl),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        coin.name,
                        style: theme.textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
                Text(
                  '${coin.priceInUSD.toStringAsFixed(3)} \$',
                  selectionColor: Colors.black,
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
