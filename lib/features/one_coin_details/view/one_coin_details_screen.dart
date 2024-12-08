import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:crypto_currency/features/one_coin_details/bloc/one_coin_details_bloc.dart';
import 'package:crypto_currency/features/one_coin_details/widgets/one_coin_details_success_screen.dart';
import 'package:crypto_currency/repositories/crypto_compare/models/crypto_coin.dart';
import 'package:crypto_currency/widgets/something_went_wrong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class OneCoinDetailScreen extends StatefulWidget {
  const OneCoinDetailScreen({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  State<OneCoinDetailScreen> createState() => _OneCoinDetailScreenState();
}

class _OneCoinDetailScreenState extends State<OneCoinDetailScreen> {
  final _cryptoCoinBloc = OneCoinDetailsBloc(GetIt.I.get());

  String? title;

  @override
  void didChangeDependencies() {
    setState(() {
      title = widget.coin.name;
    });

    _cryptoCoinBloc.add(OneCoinDetailsLoadingData(coin: widget.coin));

    _cryptoCoinBloc.add(OneCoinDetailsStartPeriodicTimer());

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(title ?? '...')),
      body: RefreshIndicator.adaptive(
          onRefresh: () async {
            final completer = Completer();
            _cryptoCoinBloc.add(OneCoinDetailsLoadingData(
                coin: widget.coin, completer: completer));
            return completer.future;
          },
          child: BlocBuilder<OneCoinDetailsBloc, OneCoinDetailsState>(
            bloc: _cryptoCoinBloc,
            builder: (context, state) {
              switch (state) {
                case OneCoinDetailsInitial():
                  return Container();
                case OneCoinDetailsLoading():
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                case OneCoinDetailsSuccess():
                  return OneCoinDetailsSuccessScreen(
                    coin: widget.coin,
                    coinInfo: state.coinInfo,
                  );
                case OneCoinDetailsFailure():
                  return const SomethingWentWrong();
              }
            },
          )));

  @override
  void dispose() {
    _cryptoCoinBloc.add(OneCoinDetailsDispose());
    super.dispose();
  }
}

class OneCoinDetailScreenArguments {
  final CryptoCoin coin;

  OneCoinDetailScreenArguments(this.coin);
}
