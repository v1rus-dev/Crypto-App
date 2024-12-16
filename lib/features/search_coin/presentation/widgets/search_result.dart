import 'package:crypto_currency/common/presentation/widgets/simple_coin_list_view.dart';
import 'package:crypto_currency/features/search_coin/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    final searchState = SearchState.of(context);
    return SliverClip(
      child: SliverList.separated(
        itemCount: searchState.state.searchResults.length,
        itemBuilder: (buildContext, index) => SimpleCoinListView(
          name: searchState.state.searchResults[index].name,
          coinName: searchState.state.searchResults[index].coinName,
          onTap: searchState.onTap,
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 16,
        ),
      ),
    );
  }
}
