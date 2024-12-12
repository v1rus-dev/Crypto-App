import 'package:auto_route/annotations.dart';
import 'package:crypto_currency/features/one_coin_details/domain/bloc/one_coin_details_bloc.dart';
import 'package:crypto_currency/features/one_coin_details/domain/datasource/one_coin_local_datasource.dart';
import 'package:crypto_currency/features/one_coin_details/domain/datasource/one_coin_network_datasource.dart';
import 'package:crypto_currency/features/one_coin_details/domain/repository/one_coin_repository.dart';
import 'package:crypto_currency/features/one_coin_details/presentation/widgets/one_coin_details_success_screen.dart';
import 'package:crypto_currency/data/database/dto/crypto_coin_local_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class OneCoinDetailScreen extends StatefulWidget {
  const OneCoinDetailScreen({super.key, required this.coinName});

  final String coinName;

  @override
  State<OneCoinDetailScreen> createState() => _OneCoinDetailScreenState();
}

class _OneCoinDetailScreenState extends State<OneCoinDetailScreen> {
  late final OneCoinDetailsBloc bloc = OneCoinDetailsBloc(
      repository: OneCoinRepository(
          localDatasource: OneCoinLocalDatasource(),
          networkDatasource: OneCoinNetworkDatasource()));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.add(OneCoinDetailsLoadData(coinName: widget.coinName));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text('...')),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<OneCoinDetailsBloc, OneCoinDetailsState>(
          bloc: bloc,
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
  final CryptoCoinLocalDTO coin;

  OneCoinDetailScreenArguments(this.coin);
}
