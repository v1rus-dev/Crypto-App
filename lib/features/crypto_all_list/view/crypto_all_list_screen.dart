import 'package:auto_route/auto_route.dart';
import 'package:crypto_currency/features/crypto_all_list/domain/bloc/crypto_all_list_bloc.dart';
import 'package:crypto_currency/features/crypto_all_list/domain/datasources/crypto_all_list_local_datasource.dart';
import 'package:crypto_currency/features/crypto_all_list/domain/datasources/crypto_all_list_remote_datasource.dart';
import 'package:crypto_currency/features/crypto_all_list/domain/repository/crypto_all_list_repository.dart';
import 'package:crypto_currency/features/crypto_all_list/widgets/all_list_toolbar.dart';
import 'package:crypto_currency/features/crypto_all_list/widgets/crypto_coin_grid_view.dart';
import 'package:crypto_currency/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => _cryptoAllListBloc,
      child: BlocBuilder<CryptoAllListBloc, CryptoAllListState>(
        builder: (context, state) => Scaffold(
            resizeToAvoidBottomInset: false,
            body: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                const SliverAppBar(
                  backgroundColor: Colors.white,
                  shadowColor: Colors.grey,
                  floating: true,
                  snap: true,
                  toolbarHeight: 70,
                  bottom: PreferredSize(
                      preferredSize: Size.fromHeight(48),
                      child: Column(
                        children: [
                          AllListToolbar(),
                          Gap(24),
                          Divider(
                            height: 1,
                          )
                        ],
                      )),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 16,
                  ),
                ),
                SliverGrid.builder(
                  itemCount: state.list.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return CryptoCoinGridView(
                        key: Key(state.list[index].name),
                        name: state.list[index].name,
                        fullName: state.list[index].coinName,
                        onTap: () {
                          AutoRouter.of(context).push(
                              OneCoinDetailRoute(coin: state.list[index]));
                        },
                      );
                    })
                // SliverAnimatedGrid(
                //     initialItemCount: 0,
                //     itemBuilder: (BuildContext context, int index,
                //         Animation<double> animation) {
                //       return CryptoCoinGridView(
                //         key: Key(state.list[index].name),
                //         name: state.list[index].name,
                //         fullName: state.list[index].coinName,
                //         onTap: () {
                //           AutoRouter.of(context).push(
                //               OneCoinDetailRoute(coin: state.list[index]));
                //         },
                //       );
                //     },
                //     gridDelegate:
                //         const SliverGridDelegateWithFixedCrossAxisCount(
                //             crossAxisCount: 2))
                // SliverAnimatedGrid(
                //   itemBuilder: (BuildContext context, int index) {
                //     return Container(
                //       alignment: Alignment.center,
                //       child: CryptoCoinGridView(
                //         key: Key(state.list[index].name),
                //         name: state.list[index].name,
                //         fullName: state.list[index].coinName,
                //         onTap: () {
                //           AutoRouter.of(context).push(
                //               OneCoinDetailRoute(coin: state.list[index]));
                //         },
                //       ),
                //     );
                //   },
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2),
                // )
              ],
            )),
      ),
    );
  }

  // return Scaffold(
  //   body: BlocBuilder<CryptoAllListBloc, CryptoAllListState>(
  //       bloc: _cryptoAllListBloc,
  //       builder: (context, state) {
  //         if (state.isLoading) {
  //           return const Center(child: CircularProgressIndicator.adaptive());
  //         } else {
  //           return Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 8),
  //             child: GridView.builder(
  //                 gridDelegate:
  //                     const SliverGridDelegateWithMaxCrossAxisExtent(
  //                         maxCrossAxisExtent: 300),
  //                 itemCount: state.list.length,
  //                 itemBuilder: (_, index) {
  //                   return CryptoCoinGridView(
  //                       key: Key(state.list[index].name),
  //                       onTap: () => {
  //                             AutoRouter.of(context).push(
  //                                 OneCoinDetailRoute(coin: state.list[index]))
  //                             // Navigator.pushNamed(
  //                             //     context, OneCoinDetailScreen.routeName,
  //                             //     arguments: OneCoinDetailScreenArguments(
  //                             //         state.list[index]))
  //                           },
  //                       name: state.list[index].name,
  //                       fullName: state.list[index].coinName);
  //                 }),
  //           );
  //         }
  //       }),
  // );
}
