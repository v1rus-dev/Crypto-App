import 'package:crypto_currency/repositories/crypto_compare/models/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  static const routeName = "/coin";

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {

  String? title;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is CryptoCoinScreenArguments, 'You must provide CryptoCoinScreenArguments!!!');

    CryptoCoinScreenArguments arguments = args as CryptoCoinScreenArguments;

    setState(() {
      title = arguments.coin.name;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(
      title: Text(title ?? '...')),
    );
  }

class CryptoCoinScreenArguments {
  final CryptoCoin coin;

  CryptoCoinScreenArguments(this.coin);
}