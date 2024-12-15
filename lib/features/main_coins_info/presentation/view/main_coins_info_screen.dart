import 'package:auto_route/auto_route.dart';
import 'package:crypto_currency/common/favorites/domain/bloc/favorites_bloc.dart';
import 'package:crypto_currency/features/main_coins_info/domain/bloc/main_coins_info_bloc.dart';
import 'package:crypto_currency/features/main_coins_info/presentation/widgets/coin_info_item.dart';
import 'package:crypto_currency/features/main_coins_info/presentation/widgets/converter_card.dart';
import 'package:crypto_currency/router/router.gr.dart';
import 'package:crypto_currency/widgets/main_appbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class MainCoinsInfoScreen extends StatefulWidget {
  const MainCoinsInfoScreen({super.key});

  @override
  State<MainCoinsInfoScreen> createState() => MainCoinsInfoScreenState();
}

class MainCoinsInfoScreenState extends State<MainCoinsInfoScreen> {
  @override
  Widget build(BuildContext context) =>
      BlocListener<FavoritesBloc, FavoritesBlocState>(
        listener: (context, state) {
          if (state is FavoritesUpdated) {
            context.read<MainCoinInfoBloc>().add(GetFavoriteCoinsEvent());
          }
        },
        child: Scaffold(
          appBar: MainAppbar(
            title: "Next.io".toUpperCase(),
            actions: kDebugMode
                ? [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  TalkerScreen(talker: GetIt.I.get<Talker>())));
                        },
                        icon: const Icon(Icons.settings)),
                  ]
                : null,
          ),
          body: BlocBuilder<MainCoinInfoBloc, MainCoinsInfoState>(
              builder: (context, state) => CustomScrollView(
                    slivers: [
                      const SliverGap(20),
                      SliverToBoxAdapter(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CardConverter(onTap: () {
                          context.router.push(const ConverterRoute());
                        }),
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
                  )),
        ),
      );
}
