import 'package:crypto_currency/widgets/crypto_icon.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CryptoCoinGridView extends StatelessWidget {
  const CryptoCoinGridView(
      {super.key, required this.name, required this.fullName, this.onTap});

  final String name;
  final String fullName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CryptoIcon(name: name),
          const Gap(8),
          Text(
            fullName,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
