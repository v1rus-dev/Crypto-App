import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:crypto_currency/features/converter/domain/entities/keyboard_type.dart';
import 'package:flutter/material.dart';

class KeyboardButton extends StatefulWidget {
  KeyboardButton({super.key, required this.type, this.onTap});

  final KeyboardType type;
  Function(KeyboardType)? onTap;

  @override
  State<KeyboardButton> createState() => _KeyboardButtonState();
}

class _KeyboardButtonState extends State<KeyboardButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Material(
        // borderRadius: BorderRadius.circular(4),
        child: InkWell(
          onTap: () {
            widget.onTap?.call(widget.type);
          },
          // borderRadius: BorderRadius.circular(4),
          child: AspectRatio(
            aspectRatio: 2,
            child: Center(
              child: Text(getText(widget.type)),
            ),
          ),
        ),
      );

  String getText(KeyboardType type) => switch (type) {
        KeyboardType.zero => '0',
        KeyboardType.one => '1',
        KeyboardType.two => '2',
        KeyboardType.three => '3',
        KeyboardType.four => '4',
        KeyboardType.five => '5',
        KeyboardType.six => '6',
        KeyboardType.seven => '7',
        KeyboardType.eight => '8',
        KeyboardType.nine => '9',
        KeyboardType.dot => '.',
        KeyboardType.remove => '<-',
      };
}
