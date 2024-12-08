import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:crypto_currency/features/one_coin_details/domain/bloc/one_coin_details_bloc.dart';
import 'package:crypto_currency/features/one_coin_details/domain/datasource/one_coin_local_datasource.dart';
import 'package:crypto_currency/features/one_coin_details/domain/datasource/one_coin_network_datasource.dart';
import 'package:crypto_currency/features/one_coin_details/domain/repository/one_coin_repository.dart';
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
  final _cryptoCoinBloc = OneCoinDetailsBloc(
      repository: OneCoinRepository(
          localDatasource: OneCoinLocalDatasource(),
          networkDatasource: OneCoinNetworkDatasource()));

  String? title;

  @override
  void didChangeDependencies() {
    setState(() {
      title = widget.coin.name;
    });

    _cryptoCoinBloc.add(OneCoinDetailsLoadingData(coin: widget.coin));

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(title ?? '...')),
      body: BlocProvider(
        create: (context) => _cryptoCoinBloc,
        child: BlocBuilder<OneCoinDetailsBloc, OneCoinDetailsState>(
          bloc: _cryptoCoinBloc,
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else {
              return const OneCoinDetailsSuccessScreen();
            }
          },
        ),
      ));
}

class OneCoinDetailScreenArguments {
  final CryptoCoin coin;

  OneCoinDetailScreenArguments(this.coin);
}
