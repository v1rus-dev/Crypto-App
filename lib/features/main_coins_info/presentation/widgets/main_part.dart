import 'package:auto_route/auto_route.dart';
import 'package:crypto_currency/features/main_coins_info/domain/bloc/main_coins_info_bloc.dart';
import 'package:crypto_currency/features/main_coins_info/presentation/widgets/coin_info_item.dart';
import 'package:crypto_currency/features/main_coins_info/presentation/widgets/converter_card.dart';
import 'package:crypto_currency/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MainPart extends StatelessWidget {
  const MainPart({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MainCoinInfoBloc, MainCoinInfoState>(
        builder: (context, state) => switch (state) {
          MainCoinsInfoStateInitial() => _buildInitial(context),
          ListOfCoins() => _buildList(context, state)
        },
      );

  _buildInitial(BuildContext context) => Container();

  _buildList(BuildContext context, ListOfCoins state) => CustomScrollView(
        slivers: [
          const SliverGap(20),
          const SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ConverterCard(),
          )),
          const SliverGap(20),
          SliverList.separated(
              itemCount: state.coins.length,
              separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
              itemBuilder: (context, index) => CoinInfoItem(
                    key: Key(state.coins[index].name),
                    coinInfo: state.coins[index],
                    onTap: () {
                      context.router.push(OneCoinDetailRoute(
                          coinName: state.coins[index].name));
                    },
                  ))
        ],
      );
}
