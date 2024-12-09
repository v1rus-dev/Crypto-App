import 'package:crypto_currency/features/search_coin/domain/bloc/search_coin_bloc.dart';
import 'package:crypto_currency/features/search_coin/domain/datasource/local_search_coins_datasource.dart';
import 'package:crypto_currency/features/search_coin/domain/repository/search_coin_repository.dart';
import 'package:crypto_currency/features/search_coin/widgets/coin_search_result.dart';
import 'package:crypto_currency/features/search_coin/widgets/hint.dart';
import 'package:crypto_currency/generated/l10n.dart';
import 'package:crypto_currency/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SearchCoinBottomSheet extends StatefulWidget {
  const SearchCoinBottomSheet({super.key});

  @override
  State<SearchCoinBottomSheet> createState() => _SearchCoinBottomSheetState();
}

class _SearchCoinBottomSheetState extends State<SearchCoinBottomSheet> {
  final _searchCoinBloc = SearchCoinBloc(
      searchCoinRepository: SearchCoinRepository(
          localCoinsDatasource: LocalSearchCoinsDatasource()));

  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController.addListener(() {
      _searchCoinBloc
          .add(SearchCoinUpdateSearchEvent(search: textEditingController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _searchCoinBloc,
      child: BlocBuilder<SearchCoinBloc, SearchCoinState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              _buildHeader(),
              const SliverGap(16),
              _buildHints(state),
              _buildSearchList(state)
            ],
          );
        },
      ),
    );
  }

  SliverPinnedHeader _buildHeader() => SliverPinnedHeader(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SearchTextField(
            hintText: S.current.search_token,
            controller: textEditingController),
      ));

  SliverClip _buildHints(SearchCoinState state) => SliverClip(
          child: SliverToBoxAdapter(
        child: SizedBox(
          height: 48,
          child: StreamBuilder(
              stream: state.searchHintsController.stream,
              builder: (context, snapshot) {
                return ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data?.length ?? 0,
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 8);
                    },
                    itemBuilder: (buildContext, index) {
                      return Hint(
                          hintText: (snapshot.data ?? [])[index],
                          onTap: (value) =>
                              {textEditingController.text = value});
                    });
              }),
        ),
      ));

  SliverClip _buildSearchList(SearchCoinState state) => SliverClip(
        child: StreamBuilder(
          stream: state.searchResultController.stream,
          builder: (context, snapshot) {
            return SliverList.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (buildContext, index) {
                  return CoinSearchResult(
                      coin: (snapshot.data ?? [])[index], onTap: () {});
                });
          },
        ),
      );
}
