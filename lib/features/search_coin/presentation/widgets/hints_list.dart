import 'package:crypto_currency/features/search_coin/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HintsList extends StatelessWidget {
  const HintsList({super.key});

  @override
  Widget build(BuildContext context) {
    final searchState = SearchState.of(context);
    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: searchState.state.hints.length,
        itemBuilder: (buildContext, index) => Hint(
          hintText: searchState.state.hints[index],
          onTap: (value) {
            searchState.textEditingController.text = value;
          },
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 8,
        ),
      ),
    );
  }
}
