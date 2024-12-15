import 'package:crypto_currency/features/converter/domain/entities/keyboard_type.dart';
import 'package:crypto_currency/features/converter/presentation/widgets/keyboard_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class KeyboardButtonWrapper extends StatelessWidget {
  const KeyboardButtonWrapper(
      {super.key, required this.type, required this.padding});

  final KeyboardType type;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Padding(
          padding: padding,
          child: AspectRatio(
            aspectRatio: 1,
            child: KeyboardButton(type: type),
          ),
        ),
      );
}
