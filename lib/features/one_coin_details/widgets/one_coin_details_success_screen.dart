import 'package:crypto_currency/features/one_coin_details/widgets/one_coin_top_part.dart';
import 'package:crypto_currency/repositories/crypto_compare/crypto_compare.dart';
import 'package:crypto_currency/repositories/crypto_compare/models/coin_info.dart';
import 'package:crypto_currency/widgets/crypto_icon.dart';
import 'package:flutter/material.dart';

class OneCoinDetailsSuccessScreen extends StatefulWidget {
  const OneCoinDetailsSuccessScreen(
      {super.key, required this.coin, required this.coinInfo});

  final CryptoCoin coin;
  final CoinInfo coinInfo;

  @override
  State<OneCoinDetailsSuccessScreen> createState() =>
      OneCoinDetailsSuccessScreenState();
}

class OneCoinDetailsSuccessScreenState
    extends State<OneCoinDetailsSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: ConstrainedBox(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: OneCoinTopPart(coinSmallName: widget.coin.name, coinName: widget.coinInfo.coinName),
            )
          ],
        ),
      ),
    );
  }
}
