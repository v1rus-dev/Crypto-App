import 'dart:async';

import 'package:crypto_currency/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_currency/features/crypto_list/widgets/widgets.dart';
import 'package:crypto_currency/repositories/crypto_compare/crypto_compare.dart';
import 'package:crypto_currency/widgets/main_appbar.dart';
import 'package:crypto_currency/widgets/something_went_wrong.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => CryptoListScreenState();
}

class CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc =
      CryptoListBloc(GetIt.I<AbstractCryptoCompareRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: MainAppbar(title: "Next.io".toUpperCase()),
        body: RefreshIndicator.adaptive(
          onRefresh: () async {
            final completer = Completer();
            _cryptoListBloc.add(LoadCryptoList(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
              bloc: _cryptoListBloc,
              builder: (context, state) {
                switch (state) {
                  case CryptoListInitial():
                    return Container();
                  case CryptoListLoading():
                    return const Center(child: CircularProgressIndicator());
                  case CryptoListSuccess():
                    return ListView.separated(
                        itemCount: state.coinsList.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, i) {
                          return CryptoItem(coin: state.coinsList[i]);
                        });
                  case CryptoListLoadingFailure():
                    return SomethingWentWrong(onTap: () {});
                }
              }),
        ));
  }
}
