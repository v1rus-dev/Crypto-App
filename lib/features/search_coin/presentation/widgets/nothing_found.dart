import 'package:crypto_currency/common/presentation/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class NothingFound extends StatelessWidget {
  const NothingFound({super.key});

  @override
  Widget build(BuildContext context) => SliverClip(
        child: SliverToBoxAdapter(
          child: Column(
            children: [
              Text(context.lang.search_nothing_found_title),
              Text(context.lang.search_nothing_found_desc)
            ],
          ),
        ),
      );
}
