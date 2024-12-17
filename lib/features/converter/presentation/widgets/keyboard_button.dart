import 'package:crypto_currency/features/converter/domain/entities/keyboard_type.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class KeyboardButton extends StatefulWidget {
  KeyboardButton({super.key, required this.type, this.onTap});

  final KeyboardType type;
  Function(BuildContext, KeyboardType)? onTap;

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
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            widget.onTap?.call(context, widget.type);
          },
          clipBehavior: Clip.antiAlias,
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              getText(widget.type),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
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
