
import 'package:crypto_currency/features/crypto_list/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, this.title});

  final String? title;

  @override
  State<CryptoListScreen> createState() => CryptoListScreenState();
}

class CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title ?? 'Default Title'), centerTitle: true),
      body: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, i) => const CryptoItem(coinName: 'Bitcoin')),
    );
  }
}
