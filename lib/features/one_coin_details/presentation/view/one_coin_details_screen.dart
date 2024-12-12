import 'package:auto_route/annotations.dart';
import 'package:crypto_currency/features/one_coin_details/domain/bloc/one_coin_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class OneCoinDetailScreen extends StatefulWidget {
  const OneCoinDetailScreen({super.key, required this.coinName});

  final String coinName;

  @override
  State<OneCoinDetailScreen> createState() => _OneCoinDetailScreenState();
}

class _OneCoinDetailScreenState extends State<OneCoinDetailScreen> {
  late final OneCoinDetailsBloc bloc = OneCoinDetailsBloc(
    repository: GetIt.I.get(),
  );

  @override
  void initState() {
    super.initState();
    bloc.add(OneCoinDetailsLoadData(coinName: widget.coinName));
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<OneCoinDetailsBloc, OneCoinDetailsState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(title: Text(state.coinName)),
              body: state.isLoading ? _buildLoading() : _buildSuccess(state));
        },
      );

  Widget _buildSuccess(OneCoinDetailsState state) => CustomScrollView();

  Widget _buildLoading() => const Center(
        child: CircularProgressIndicator.adaptive(),
      );
}
