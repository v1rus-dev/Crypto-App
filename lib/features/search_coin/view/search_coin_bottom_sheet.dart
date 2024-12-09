import 'package:flutter/material.dart';

class SearchCoinBottomSheet extends StatelessWidget {
  const SearchCoinBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 150,
          bottom: PreferredSize(
              preferredSize: const Size.fromWidth(48),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: TextField(),
              )),
        ),
      ],
    );
  }
}
