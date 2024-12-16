import 'package:crypto_currency/utils/color_extensions.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField(
      {super.key,
      required this.hintText,
      this.leadingIcon,
      this.onChanged,
      this.controller,
      this.focusNode});

  final String hintText;
  final Widget? leadingIcon;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      focusNode: widget.focusNode,
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
