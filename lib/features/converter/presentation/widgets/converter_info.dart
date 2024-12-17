import 'package:crypto_currency/features/converter/domain/bloc/converter_state.dart';
import 'package:crypto_currency/features/converter/domain/entities/entities.dart';
import 'package:crypto_currency/features/converter/presentation/widgets/converter_card.dart';
import 'package:crypto_currency/features/search_coin/presentation/view/search_coin_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../domain/bloc/converter_bloc.dart';

class ConverterInfo extends StatelessWidget {
  const ConverterInfo({super.key});

  Future<String?> _openSelectCoinBottomSheet(
      BuildContext context, ConverterSideType type) async {
    assert(type is FromSide || type is ToSide);
    final result = await showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
        showDragHandle: true,
        isScrollControlled: true,
        useRootNavigator: true,
        useSafeArea: true,
        builder: (buildContext) {
          return const SearchCoinBottomSheet();
        });
    debugPrint("RESULT: ${result as String?}");
    assert(result == null || result is String);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ConverterBloc>();
    return BlocBuilder<ConverterBloc, ConverterState>(
      builder: (context, state) {
        return Column(
          children: [
            ConverterCard(
              count: state.from.toString(),
              type: FromSide(),
              hint: 'Из',
              isSelected: state.selectedType is FromSide,
              selectedCoin: state.selectedCoinFrom,
              onTap: () {
                context
                    .read<ConverterBloc>()
                    .add(SetSelectedType(type: FromSide()));
              },
              onTapOnSelectedCoin: () async {
                final result =
                    await _openSelectCoinBottomSheet(context, FromSide());
                if (result != null) {
                  bloc.add(SetCoinType(coin: result, type: FromSide()));
                }
              },
            ),
            const Gap(20),
            ConverterCard(
              count: state.to.toString(),
              type: ToSide(),
              hint: "В",
              isSelected: state.selectedType is ToSide,
              selectedCoin: state.selectedCoinTo,
              onTap: () {
                context
                    .read<ConverterBloc>()
                    .add(SetSelectedType(type: ToSide()));
              },
              onTapOnSelectedCoin: () async {
                final result =
                    await _openSelectCoinBottomSheet(context, ToSide());
                if (result != null) {
                  bloc.add(SetCoinType(coin: result, type: ToSide()));
                }
              },
            )
          ],
        );
      },
    );
  }
}
