import 'package:crypto_currency/features/one_coin_details/domain/bloc/one_coin_details_bloc.dart';
import 'package:crypto_currency/generated/l10n.dart';
import 'package:crypto_currency/utils/app_images.dart';
import 'package:crypto_currency/utils/color_extensions.dart';
import 'package:crypto_currency/widgets/crypto_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class OneCoinTopPart extends StatelessWidget {
  const OneCoinTopPart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<OneCoinDetailsBloc, OneCoinDetailsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                      width: 44,
                      height: 44,
                      child: CryptoIcon(name: state.coin?.name ?? '')),
                  const Gap(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(state.coin?.name ?? '',
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      const Gap(4),
                      Text(state.coin?.coinName ?? '',
                          style: theme.textTheme.bodySmall),
                    ],
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          splashRadius: 24,
                          onPressed: () {},
                          icon: SvgPicture.asset(AppImages.bell)),
                      IconButton(
                          splashRadius: 24,
                          onPressed: () {},
                          icon: SvgPicture.asset(AppImages.document)),
                      IconButton(
                          splashRadius: 24,
                          onPressed: () {},
                          icon: SvgPicture.asset(AppImages.share)),
                      IconButton(
                          splashRadius: 24,
                          onPressed: () {},
                          icon: SvgPicture.asset(AppImages.star))
                    ],
                  ))
                ],
              ),
              const Gap(16),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$ ${state.price.toStringAsFixed(state.price > 1 ? 3 : 6)}",
                        style:
                            theme.textTheme.titleLarge?.copyWith(fontSize: 28),
                      ),
                      const Gap(4),
                      Text(
                        "${(state.changePrcDay > 0) ? '+' : ''}${state.changePrcDay.toStringAsFixed(3)}",
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(color: (state.changePrcDay < 0) ? Colors.red : Colors.green),
                      )
                    ],
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${S.of(context).high_value}:',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                    color: HexColor.fromHex("727272")),
                              ),
                              Gap(10),
                              Text(
                                state.maxPrice
                                    .toStringAsFixed(state.price > 1 ? 3 : 6),
                                style: theme.textTheme.bodyMedium
                                    ?.copyWith(color: Colors.black),
                              )
                            ],
                          ),
                          const Gap(4),
                          Row(
                            children: [
                              Text(
                                '${S.of(context).low_value}: ',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                    color: HexColor.fromHex("727272")),
                              ),
                              Gap(10),
                              Text(
                                state.lowerPrice
                                    .toStringAsFixed(state.price > 1 ? 3 : 6),
                                style: theme.textTheme.bodyMedium
                                    ?.copyWith(color: Colors.black),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
