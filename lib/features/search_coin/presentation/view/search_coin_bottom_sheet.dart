import 'package:crypto_currency/features/search_coin/data/datasource/datasource.dart';
import 'package:crypto_currency/features/search_coin/data/repository_impl/search_coin_repository_impl.dart';
import 'package:crypto_currency/features/search_coin/domain/bloc/search_coin_bloc.dart';
import 'package:crypto_currency/features/search_coin/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
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
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      _searchCoinBloc
          .add(SearchCoinUpdateSearchEvent(search: textEditingController.text));
    });
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _searchCoinBloc,
      child: BlocBuilder<SearchCoinBloc, SearchCoinState>(
        builder: (context, state) {
          return SearchState(
              state: state,
              textEditingController: textEditingController,
              onTap: (coinName) {
                Navigator.of(context).pop(coinName);
              },
              focusNode: focusNode,
              child: CustomScrollView(
                slivers: [
                  const SearchHeader(),
                  ...state.nothingFound
                      ? [const NothingFound()]
                      : [const SliverGap(8), const SearchResult()],
                ],
              ));
        },
      ),
    );
  }
}
