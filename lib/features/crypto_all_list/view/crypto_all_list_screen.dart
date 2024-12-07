import 'package:crypto_currency/features/crypto_all_list/domain/bloc/crypto_all_list_bloc.dart';
import 'package:crypto_currency/features/crypto_all_list/domain/datasources/crypto_all_list_local_datasource.dart';
import 'package:crypto_currency/features/crypto_all_list/domain/datasources/crypto_all_list_remote_datasource.dart';
import 'package:crypto_currency/features/crypto_all_list/domain/repository/crypto_all_list_repository.dart';
import 'package:crypto_currency/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_currency/features/crypto_list/widgets/crypto_item.dart';
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
  final _cryptoAllListBloc = CryptoAllListBloc(
      repository: CryptoAllListRepository(
          localDatasource: CryptoAllListLocalDatasource(),
          remoteDatasource: CryptoAllListRemoteDatasource()));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cryptoAllListBloc.add(CryptoAllListInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All coins"),
      ),
      body: BlocBuilder<CryptoAllListBloc, CryptoAllListState>(
          bloc: _cryptoAllListBloc,
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else {
              return ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  return CryptoItem(coin: state.list[index]);
                });
            }
          }),
    );
  }
}
