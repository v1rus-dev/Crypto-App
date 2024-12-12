import 'package:auto_route/auto_route.dart';
import 'package:crypto_currency/features/crypto_all_list/domain/cubit/crypto_all_list_cubit.dart';
import 'package:crypto_currency/features/crypto_all_list/domain/datasources/crypto_all_list_local_datasource.dart';
import 'package:crypto_currency/features/crypto_all_list/domain/datasources/crypto_all_list_remote_datasource.dart';
import 'package:crypto_currency/features/crypto_all_list/domain/repository/crypto_all_list_repository.dart';
import 'package:crypto_currency/features/crypto_all_list/widgets/all_list_toolbar.dart';
import 'package:crypto_currency/features/crypto_all_list/widgets/crypto_coin_grid_view.dart';
import 'package:crypto_currency/features/search_coin/view/search_coin_bottom_sheet.dart';
import 'package:crypto_currency/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

@RoutePage()
class CryptoAllListScreen extends StatefulWidget {
  const CryptoAllListScreen({super.key});

  @override
  State<CryptoAllListScreen> createState() => _CryptoAllListScreenState();
}

class _CryptoAllListScreenState extends State<CryptoAllListScreen> {
  final _cryptoAllListCubit = CryptoAllListCubit(
      repository: CryptoAllListRepository(
          localDatasource: CryptoAllListLocalDatasource(),
          remoteDatasource: CryptoAllListRemoteDatasource()));

  @override
  void initState() {
    super.initState();
    _cryptoAllListCubit.init();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => _cryptoAllListCubit,
      child: BlocBuilder<CryptoAllListCubit, CryptoAllListState>(
        builder: (context, state) => Scaffold(
            resizeToAvoidBottomInset: false,
            body: state.isLoading ? _buildLoading() : _buildSuccess(state)),
      ),
    );
  }

  Widget _buildLoading() => const Center(
        child: CircularProgressIndicator.adaptive(),
      );

  Widget _buildSuccess(CryptoAllListState state) => CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.grey,
            floating: true,
            snap: true,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(48),
                child: Column(
                  children: [
                    AllListToolbar(onTap: () {
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
                            return const SearchCoinBottomSheet();
                          });
                    }),
                    const Gap(24),
                    const Divider(
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return CryptoCoinGridView(
                  key: Key(state.list[index].name),
                  name: state.list[index].name,
                  fullName: state.list[index].coinName,
                  onTap: () {
                  },
                );
              })
        ],
      );
}
