import 'package:crypto_currency/features/crypto_coin/view/crypto_coin_screen.dart';
import 'package:crypto_currency/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CryptoItem extends StatelessWidget {
  const CryptoItem({super.key, required this.coinName});

  final String coinName;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
      title: Text(
        coinName,
        style: theme.textTheme.titleMedium!,
      ),
      subtitle: Text(
        "20 000\$",
        style: theme.textTheme.bodyMedium,
      ),
      leading: SvgPicture.asset(
        Images.bitcoinLogo,
        height: 25,
        width: 25,
      ),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.of(context).pushNamed(CryptoCoinScreen.routeName,
            arguments: CryptoCoinScreenArguments("Bitcoin"));
      },
    );
  }
}
