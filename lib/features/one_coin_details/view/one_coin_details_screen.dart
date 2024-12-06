import 'dart:async';

import 'package:crypto_currency/features/one_coin_details/bloc/one_coin_details_bloc.dart';
import 'package:crypto_currency/features/one_coin_details/widgets/one_coin_details_success_screen.dart';
import 'package:crypto_currency/repositories/crypto_compare/abstract_coins_repository.dart';
import 'package:crypto_currency/repositories/crypto_compare/models/crypto_coin.dart';
import 'package:crypto_currency/widgets/something_went_wrong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class OneCoinDetailScreen extends StatefulWidget {
  const OneCoinDetailScreen({super.key});

  static const routeName = "/coin";

  @override
  State<OneCoinDetailScreen> createState() => _OneCoinDetailScreenState();
}

class _OneCoinDetailScreenState extends State<OneCoinDetailScreen> {
  final _cryptoCoinBloc =
      OneCoinDetailsBloc(GetIt.I.get<AbstractCryptoCompareRepository>());

  String? title;
  late OneCoinDetailScreenArguments arguments;

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

    arguments = args as OneCoinDetailScreenArguments;

    setState(() {
      title = arguments.coin.name;
    });

    _cryptoCoinBloc.add(CryptoCoinLoadingData(coin: arguments.coin));

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(title ?? '...')),
      body: RefreshIndicator.adaptive(
          onRefresh: () async {
            final completer = Completer();
            _cryptoCoinBloc.add(CryptoCoinLoadingData(
                coin: arguments.coin, completer: completer));
            return completer.future;
          },
          child: BlocBuilder<OneCoinDetailsBloc, OneCoinDetailsState>(
            bloc: _cryptoCoinBloc,
            builder: (context, state) {
              switch (state) {
                case OneCoinDetailsInitial():
                  return Container();
                case OneCoinDetailsLoading():
                  return const Center(child: CircularProgressIndicator.adaptive());
                case OneCoinDetailsSuccess():
                  return OneCoinDetailsSuccessScreen(coin: arguments.coin, coinInfo: state.coinInfo,);
                case OneCoinDetailsFailure():
                  return const SomethingWentWrong();
              }
            },
          )));
}

class OneCoinDetailScreenArguments {
  final CryptoCoin coin;

  OneCoinDetailScreenArguments(this.coin);
}
