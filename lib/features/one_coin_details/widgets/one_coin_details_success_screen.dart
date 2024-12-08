import 'package:crypto_currency/features/one_coin_details/domain/bloc/one_coin_details_bloc.dart';
import 'package:crypto_currency/features/one_coin_details/widgets/one_coin_history_part.dart';
import 'package:crypto_currency/features/one_coin_details/widgets/one_coin_top_part.dart';
import 'package:crypto_currency/repositories/crypto_compare/crypto_compare.dart';
import 'package:crypto_currency/utils/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class OneCoinDetailsSuccessScreen extends StatefulWidget {
  const OneCoinDetailsSuccessScreen({super.key});

  @override
  State<OneCoinDetailsSuccessScreen> createState() =>
      OneCoinDetailsSuccessScreenState();
}

class OneCoinDetailsSuccessScreenState
    extends State<OneCoinDetailsSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<OneCoinDetailsBloc, OneCoinDetailsState>(
        builder: (context, state) {
      return Scaffold(
        body: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(0),
          children: [
            const OneCoinTopPart(),
            const Gap(24),
            Divider(
              height: 1,
              thickness: 2,
              color: HexColor.fromHex("#E6E6E6"),
            ),
            const Gap(24),
            const OneCoinHistoryPart()
          ],
        ),
      );
    });
  }
}
