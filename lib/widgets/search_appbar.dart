import 'package:crypto_currency/utils/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class SearchAppbar extends StatefulWidget implements PreferredSizeWidget {
  SearchAppbar(
      {super.key,
      required this.hintText,
      this.leadingIcon,
      this.showDivider,
      this.onChanged});

  final String hintText;
  final Widget? leadingIcon;
  bool? showDivider;
  final ValueChanged<String>? onChanged;

  @override
  State<SearchAppbar> createState() => _SearchAppbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(96 + 24 + 2);
}

class _SearchAppbarState extends State<SearchAppbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Gap(24),
            TextField(
              onChanged: widget.onChanged,
              style: const TextStyle(fontSize: 14, color: Colors.black),
              decoration: InputDecoration(
                prefixIconConstraints:
                    const BoxConstraints.expand(width: 24, height: 24),
                hintText: widget.hintText,
                focusedBorder: _border(),
                border: _border(),
                disabledBorder: _border(),
                enabledBorder: _border(),
                hintStyle:
                    TextStyle(fontSize: 14, color: HexColor.fromHex('#727272')),
              ),
            ),
            const Gap(24),
            Divider(
              color: HexColor.fromHex('#E6E6E6'),
            )
          ],
        ),
      ),
    );
  }

  InputBorder _border({Color? color = null}) => OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      borderSide:
          BorderSide(color: color ?? HexColor.fromHex('#DDDDDD'), width: 1));
}
