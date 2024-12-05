import 'package:crypto_currency/features/crypto_all_list/bloc/crypto_all_list_bloc.dart';
import 'package:crypto_currency/repositories/crypto_compare/crypto_compare.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoAllListScreen extends StatefulWidget {
  const CryptoAllListScreen({super.key});

  @override
  State<CryptoAllListScreen> createState() => _CryptoAllListScreenState();
}

class _CryptoAllListScreenState extends State<CryptoAllListScreen> {

  final _cryptoAllListBloc = CryptoAllListBloc(cryptoCompareRepository: GetIt.I.get<AbstractCryptoCompareRepository>());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cryptoAllListBloc.add(LoadAllList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All coins"),),
      body: BlocBuilder<CryptoAllListBloc, CryptoAllListState>(bloc: _cryptoAllListBloc, builder: (context, state) {
        switch (state) {
          case CryptoAllListInitial():
            return Container();
        }
      }),
    );
  }
}