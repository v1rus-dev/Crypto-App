import 'package:crypto_currency/utils/app_images.dart';
import 'package:crypto_currency/utils/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField(
      {super.key, required this.hintText, this.leadingIcon, this.onChanged});

  final String hintText;
  final Widget? leadingIcon;
  final ValueChanged<String>? onChanged;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
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
        hintStyle: TextStyle(fontSize: 14, color: HexColor.fromHex('#727272')),
      ),
    );
  }

  InputBorder _border({Color? color = null}) => OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      borderSide:
          BorderSide(color: color ?? HexColor.fromHex('#DDDDDD'), width: 1));
}
