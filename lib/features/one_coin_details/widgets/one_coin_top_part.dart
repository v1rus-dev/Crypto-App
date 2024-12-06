import 'package:crypto_currency/widgets/crypto_icon.dart';
import 'package:flutter/material.dart';

class OneCoinTopPart extends StatelessWidget {
  const OneCoinTopPart(
      {super.key, required this.coinSmallName, required this.coinName});

  final String coinSmallName;
  final String coinName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        SizedBox(
            width: 44,
            height: 44,
            child: CryptoIcon(name: coinSmallName, imageUri: "")),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(coinSmallName,
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              Text(coinName, style: theme.textTheme.bodySmall),
            ],
          ),
        )
      ],
    );
  }
}
