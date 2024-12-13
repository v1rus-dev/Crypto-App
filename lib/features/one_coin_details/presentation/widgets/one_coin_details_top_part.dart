import 'package:crypto_currency/common/presentation/utils/context_ext.dart';
import 'package:crypto_currency/features/one_coin_details/domain/bloc/one_coin_details_bloc.dart';
import 'package:crypto_currency/utils/app_images.dart';
import 'package:crypto_currency/utils/color_extensions.dart';
import 'package:crypto_currency/widgets/crypto_icon.dart';
import 'package:crypto_currency/widgets/icon_button_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class OneCoinDetailsTopPart extends StatelessWidget {
  const OneCoinDetailsTopPart({super.key, required this.state});

  final OneCoinDetailsState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        const Gap(16),
        _buildInfo(context),
        const Gap(24),
        Divider(color: HexColor.fromHex('#E6E6E6'),)
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        const Gap(16),
        SizedBox(
          height: 64,
          width: 64,
          child: CryptoIcon(name: state.coinName),
        ),
        const Gap(16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.coinName,
              style: theme.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Gap(4),
            Text(
              state.fullCoinName,
              style: theme.textTheme.bodySmall,
            )
          ],
        ),
        Expanded(child: _buildHeaderButtons(context))
      ],
    );
  }

  Widget _buildInfo(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$ ${state.coinBaseInfo.price.toStringAsFixed(state.coinBaseInfo.price > 0 ? 3 : 6)}',
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const Gap(4),
              Text(
                '${state.coinBaseInfo.changePrcDay > 0 ? '+' : '-'} ${state.coinBaseInfo.changePrcDay.abs().toStringAsFixed(state.coinBaseInfo.price.abs() > 0 ? 3 : 6)}',
                style: theme.textTheme.bodySmall?.copyWith(
                    color: state.coinBaseInfo.changePrcDay > 0
                        ? Colors.green
                        : Colors.red),
              )
            ],
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildPriceInfo(
                  context,
                  context.lang.high_value,
                  state.coinBaseInfo.hightDay
                      .toStringAsFixed(state.coinBaseInfo.price > 0 ? 3 : 6)),
              const Gap(2),
              _buildPriceInfo(
                  context,
                  context.lang.low_value,
                  state.coinBaseInfo.lowDay
                      .toStringAsFixed(state.coinBaseInfo.price > 0 ? 3 : 6))
            ],
          ))
        ],
      ),
    );
  }

  Widget _buildPriceInfo(BuildContext context, String name, String price) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            name,
            style: context.theme.textTheme.bodySmall
                ?.copyWith(color: HexColor.fromHex('#727272')),
          ),
          const Gap(10),
          Text(
            price,
            style: context.theme.textTheme.bodySmall
                ?.copyWith(color: Colors.black),
          )
        ],
      );

  Widget _buildHeaderButtons(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButtonWrapper(
              icon: SvgPicture.asset(AppImages.bell), onPressed: () {}),
          IconButtonWrapper(
              icon: SvgPicture.asset(AppImages.document), onPressed: () {}),
          IconButtonWrapper(
              icon: SvgPicture.asset(AppImages.share), onPressed: () {}),
          IconButtonWrapper(
              icon: SvgPicture.asset(AppImages.star), onPressed: () {}),
        ],
      );
}
