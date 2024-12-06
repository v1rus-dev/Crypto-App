import 'package:crypto_currency/features/one_coin_details/widgets/one_coin_history_part.dart';
import 'package:crypto_currency/features/one_coin_details/widgets/one_coin_top_part.dart';
import 'package:crypto_currency/repositories/crypto_compare/crypto_compare.dart';
import 'package:crypto_currency/utils/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
    return Scaffold(
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(0),
        children: [
          OneCoinTopPart(
              coinSmallName: widget.coin.name,
              coinName: widget.coinInfo.coinName),
          const Gap(24),
          Divider(
            color: HexColor.fromHex("#E6E6E6"),
          ),
          const Gap(24),
          const OneCoinHistoryPart()
        ],
      ),
    );
  }
}
