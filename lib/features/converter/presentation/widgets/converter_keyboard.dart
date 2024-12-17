import 'package:crypto_currency/features/converter/domain/bloc/converter_bloc.dart';
import 'package:crypto_currency/features/converter/domain/entities/keyboard_type.dart';
import 'package:crypto_currency/features/converter/presentation/widgets/keyboard_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class ConverterKeyboard extends StatelessWidget {
  const ConverterKeyboard({super.key});

  _onTapKey(BuildContext context, KeyboardType type) {
    context.read<ConverterBloc>().add(OnKeyboardTap(type: type));
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: LayoutGrid(
          columnSizes: const [auto, auto, auto],
          rowSizes: const [
            auto,
            auto,
            auto,
            auto,
          ],
          areas: '''
                    one two three
                    four five six
                    seven eight nine
                    dot zero remove
                  ''',
          columnGap: 12,
          rowGap: 12,
          children: [
            KeyboardButton(
              type: KeyboardType.one,
              onTap: _onTapKey,
            ).inGridArea('one'),
            KeyboardButton(
              type: KeyboardType.two,
              onTap: _onTapKey,
            ).inGridArea('two'),
            KeyboardButton(
              type: KeyboardType.three,
              onTap: _onTapKey,
            ).inGridArea('three'),
            KeyboardButton(
              type: KeyboardType.four,
              onTap: _onTapKey,
            ).inGridArea('four'),
            KeyboardButton(
              type: KeyboardType.five,
              onTap: _onTapKey,
            ).inGridArea('five'),
            KeyboardButton(
              type: KeyboardType.six,
              onTap: _onTapKey,
            ).inGridArea('six'),
            KeyboardButton(
              type: KeyboardType.seven,
              onTap: _onTapKey,
            ).inGridArea('seven'),
            KeyboardButton(
              type: KeyboardType.eight,
              onTap: _onTapKey,
            ).inGridArea('eight'),
            KeyboardButton(
              type: KeyboardType.nine,
              onTap: _onTapKey,
            ).inGridArea('nine'),
            KeyboardButton(
              type: KeyboardType.dot,
              onTap: _onTapKey,
            ).inGridArea('dot'),
            KeyboardButton(
              type: KeyboardType.zero,
              onTap: _onTapKey,
            ).inGridArea('zero'),
            KeyboardButton(
              type: KeyboardType.remove,
              onTap: _onTapKey,
            ).inGridArea('remove')
          ],
        ),
      );
}
