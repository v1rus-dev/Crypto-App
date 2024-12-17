import 'package:crypto_currency/widgets/crypto_icon.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class SelectCoinButton extends StatelessWidget {
  SelectCoinButton({super.key, required this.coinName, this.onTap});

  String coinName;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Material(
        borderRadius: BorderRadius.circular(16),
        color: Colors.blueGrey[200],
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    key: Key(coinName),
                    height: 28,
                    width: 28,
                    child: CryptoIcon(name: coinName)),
                const Gap(8),
                Text(
                  coinName,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
