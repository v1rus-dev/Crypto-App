import 'package:crypto_currency/common/presentation/utils/context_ext.dart';
import 'package:crypto_currency/features/search_coin/presentation/widgets/widgets.dart';
import 'package:crypto_currency/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final searchState = SearchState.of(context);
    return SliverPinnedHeader(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchTextField(
            hintText: context.lang.search_token,
            controller: searchState.textEditingController,
            focusNode: searchState.focusNode,
          ),
        ),
        const Gap(16),
        const HintsList(),
        const Gap(8)
      ],
    ));
  }
}
