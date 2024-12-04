import 'package:crypto_currency/features/crypto_coin/view/crypto_coin_screen.dart';
import 'package:crypto_currency/repositories/crypto_compare/models/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoItem extends StatelessWidget {
  const CryptoItem({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
      title: Text(
        coin.name,
        style: theme.textTheme.titleMedium!,
      ),
      subtitle: Text(
        "${coin.priceInUSD} \$",
        style: theme.textTheme.bodyMedium,
      ),
      leading: Image.network(coin.imageUrl),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.of(context).pushNamed(CryptoCoinScreen.routeName,
            arguments: CryptoCoinScreenArguments(coin));
      },
    );
  }
}
