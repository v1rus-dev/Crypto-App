import 'package:crypto_currency/common/presentation/utils/context_ext.dart';
import 'package:crypto_currency/features/all_list_coins/presentation/view/all_list_coins_screen.dart';
import 'package:crypto_currency/utils/app_images.dart';
import 'package:crypto_currency/utils/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class AllListCoinsToolbar extends StatelessWidget {
  const AllListCoinsToolbar({super.key, required this.onTap});

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onTap: () {
          onTap.call();
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
                  context.lang.search_token,
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
    );
  }
}
