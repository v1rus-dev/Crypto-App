import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptySelectedCryptoList extends StatelessWidget {
  const EmptySelectedCryptoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset('assets/images/crypto_big_btc.png'));
  }
}
