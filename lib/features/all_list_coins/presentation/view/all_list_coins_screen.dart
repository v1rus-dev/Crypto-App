import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_currency/common/presentation/utils/context_ext.dart';
import 'package:crypto_currency/common/presentation/widgets/simple_coin_list_view.dart';
import 'package:crypto_currency/features/all_list_coins/domain/bloc/all_list_coins_bloc.dart';
import 'package:crypto_currency/features/all_list_coins/presentation/widgets/widgets.dart';
import 'package:crypto_currency/features/search_coin/presentation/view/view.dart';
import 'package:crypto_currency/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

@RoutePage()
class AllListCoinsScreen extends StatefulWidget {
  const AllListCoinsScreen({super.key});

  @override
  State<AllListCoinsScreen> createState() => _AllListCoinsScreenState();
}

class _AllListCoinsScreenState extends State<AllListCoinsScreen> {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AllListCoinsBloc, AllListCoinsState>(
        builder: (context, state) {
          switch (state) {
            case AllListCoinsInitial():
              return _loading();
            case AllListCoinsLoading():
              return _loading();
            case AllListCoinsLoaded():
              return _coinsLoaded(state);
          }
        },
      );

  Widget _loading() => const Center(
        child: CircularProgressIndicator.adaptive(),
      );

  Widget _coinsLoaded(AllListCoinsLoaded state) => Scaffold(
        body: SafeArea(
          child: RefreshIndicator.adaptive(
            edgeOffset: 150,
            onRefresh: swipeDownRefresh,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text(context.lang.coins_list),
                  elevation: 0.5,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  floating: true,
                  pinned: true,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(70),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                      child: AllListCoinsToolbar(onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(32))),
                            showDragHandle: true,
                            isScrollControlled: true,
                            useRootNavigator: true,
                            useSafeArea: true,
                            builder: (buildContext) {
                              return SearchCoinBottomSheet(
                                onTap: (name) {
                                  AutoRouter.of(context).popAndPush(
                                      OneCoinDetailRoute(coinName: name));
                                },
                              );
                            });
                      }),
                    ),
                  ),
                ),
                const SliverGap(20),
                SliverList.separated(
                  itemCount: state.listOfCoins.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
                  itemBuilder: (BuildContext context, int index) =>
                      SimpleCoinListView(
                    key: Key(state.listOfCoins[index].name),
                    name: state.listOfCoins[index].name,
                    coinName: state.listOfCoins[index].coinName,
                    onTap: (name) {
                      AutoRouter.of(context)
                          .push(OneCoinDetailRoute(coinName: name));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Future<void> swipeDownRefresh() async {
    final completer = Completer();

    context.read<AllListCoinsBloc>().add(UpdateCoinsManualy(completer));

    await completer.future;
  }
}
