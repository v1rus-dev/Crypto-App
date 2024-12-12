import 'package:crypto_currency/common/presentation/utils/context_ext.dart';
import 'package:crypto_currency/common/presentation/widgets/simple_coin_list_view.dart';
import 'package:crypto_currency/features/search_coin/data/datasource/datasource.dart';
import 'package:crypto_currency/features/search_coin/data/repository_impl/search_coin_repository_impl.dart';
import 'package:crypto_currency/features/search_coin/domain/bloc/search_coin_bloc.dart';
import 'package:crypto_currency/features/search_coin/presentation/widgets/hint.dart';
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
      searchCoinRepository:
          SearchCoinRepositoryImpl(datasource: SearchCoinLocalDatasource()));

  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
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
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                _buildHeader(state),
                ...state.nothingFound
                    ? _buildNothingFound()
                    : _buildResult(state),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildResult(SearchCoinState state) => [
        const SliverGap(8),
        _buildSearchList(state),
      ];

  SliverPinnedHeader _buildHeader(SearchCoinState state) => SliverPinnedHeader(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchTextField(
                hintText: context.lang.search_token,
                controller: textEditingController),
          ),
          const Gap(16),
          _buildHints(state),
          const Gap(8)
        ],
      ));

  SizedBox _buildHints(SearchCoinState state) => SizedBox(
        height: 48,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemCount: state.hints.length,
          separatorBuilder: (context, index) => const SizedBox(width: 8),
          itemBuilder: (buildContext, index) => Hint(
            hintText: state.hints[index],
            onTap: (value) => {textEditingController.text = value},
          ),
        ),
      );

  SliverClip _buildSearchList(SearchCoinState state) => SliverClip(
        child: SliverList.separated(
          itemCount: state.searchResults.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: 16,
          ),
          itemBuilder: (buildContext, index) => SimpleCoinListView(
            key: Key(state.searchResults[index].name),
            name: state.searchResults[index].name,
            coinName: state.searchResults[index].coinName,
            onTap: (coin) {},
          ),
        ),
      );

  List<Widget> _buildNothingFound() => [
        SliverClip(
          child: SliverToBoxAdapter(
            child: Column(
              children: [
                Text(context.lang.search_nothing_found_title),
                Text(context.lang.search_nothing_found_desc)
              ],
            ),
          ),
        )
      ];
}
