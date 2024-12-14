import 'package:crypto_currency/utils/app_images.dart';
import 'package:crypto_currency/widgets/icon_button_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class FavoriteButton extends StatefulWidget {
  FavoriteButton({super.key, required this.isFavorite, required this.onTap});

  final bool isFavorite;
  Function()? onTap;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) => IconButtonWrapper(
      icon: AnimatedCrossFade(
          firstChild: SvgPicture.asset(AppImages.starFilled),
          secondChild: SvgPicture.asset(AppImages.star),
          crossFadeState: widget.isFavorite
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 350)),
      onPressed: widget.onTap);
}
