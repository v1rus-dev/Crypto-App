import 'dart:async';
import 'package:auto_route/annotations.dart';
import 'package:crypto_currency/common/presentation/utils/context_ext.dart';
import 'package:crypto_currency/features/one_coin_details/domain/bloc/one_coin_details_bloc.dart';
import 'package:crypto_currency/features/one_coin_details/presentation/widgets/widgest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
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

  Timer? timer;

  @override
  void initState() {
    super.initState();
    bloc.add(OneCoinDetailsLoadData(coinName: widget.coinName));
    bloc.add(OneCoinDetailsUpdateHistory());
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      bloc.add(OneCoinDetailsUpdateHistory());
    });
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<OneCoinDetailsBloc, OneCoinDetailsState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(title: Text(context.lang.marker_detail)),
              body: state.isLoading ? _buildLoading() : _buildSuccess(state));
        },
      );

  Widget _buildSuccess(OneCoinDetailsState state) => CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: OneCoinDetailsTopPart(
              state: state,
            ),
          ),
          const SliverGap(24),
          SliverToBoxAdapter(
            child: OneCoinHistoryPart(state: state),
          )
        ],
      );

  Widget _buildLoading() => const Center(
        child: CircularProgressIndicator.adaptive(),
      );

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
