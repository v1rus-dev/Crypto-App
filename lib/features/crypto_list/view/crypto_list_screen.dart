import 'package:crypto_currency/features/crypto_list/widgets/widgets.dart';
import 'package:crypto_currency/repositories/crypto_compare/crypto_compare.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, this.title});

  final String? title;

  @override
  State<CryptoListScreen> createState() => CryptoListScreenState();
}

class CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title ?? 'Default Title'), centerTitle: true),
      body: (_cryptoCoinsList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: _cryptoCoinsList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                return CryptoItem(coin: _cryptoCoinsList![i]);
              }),
    );
  }

  void loadCryptoCoins() async {
    _cryptoCoinsList = await GetIt.I<AbstractCryptoCompareRepository>().getCoinsList();
    debugPrint(_cryptoCoinsList.toString());
    setState(() {});
  }
}
