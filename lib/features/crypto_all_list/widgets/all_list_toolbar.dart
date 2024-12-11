import 'package:crypto_currency/features/crypto_all_list/domain/cubit/crypto_all_list_cubit.dart';
import 'package:crypto_currency/generated/l10n.dart';
import 'package:crypto_currency/utils/app_images.dart';
import 'package:crypto_currency/utils/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class AllListToolbar extends StatefulWidget {
  const AllListToolbar({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  State<AllListToolbar> createState() => _AllListToolbarState();
}

class _AllListToolbarState extends State<AllListToolbar> {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<CryptoAllListCubit, CryptoAllListState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Material(
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                onTap: () {
                  widget.onTap.call();
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(16)),
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Gap(16),
                        SvgPicture.asset(AppImages.search),
                        const Gap(16),
                        Text(
                          S.current.search_token,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: HexColor.fromHex('#727272')),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
}
