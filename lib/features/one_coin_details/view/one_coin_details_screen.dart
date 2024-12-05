import 'package:crypto_currency/features/one_coin_details/bloc/one_coin_details_bloc.dart';
import 'package:crypto_currency/repositories/crypto_compare/abstract_coins_repository.dart';
import 'package:crypto_currency/repositories/crypto_compare/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class OneCoinDetailScreen extends StatefulWidget {
  const OneCoinDetailScreen({super.key});

  static const routeName = "/coin";

  @override
  State<OneCoinDetailScreen> createState() => _OneCoinDetailScreenState();
}

class _OneCoinDetailScreenState extends State<OneCoinDetailScreen> {
  final _cryptoCoinBloc =
      CryptoCoinBloc(GetIt.I.get<AbstractCryptoCompareRepository>());

  String? title;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is OneCoinDetailScreenArguments,
        'You must provide CryptoCoinScreenArguments!!!');

    OneCoinDetailScreenArguments arguments = args as OneCoinDetailScreenArguments;

    setState(() {
      title = arguments.coin.name;
    });

    _cryptoCoinBloc.add(CryptoCoinLoadingData(name: arguments.coin.name));

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(title ?? '...')),
      );
}

class OneCoinDetailScreenArguments {
  final CryptoCoin coin;

  OneCoinDetailScreenArguments(this.coin);
}
