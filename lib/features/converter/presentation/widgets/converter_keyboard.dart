import 'package:crypto_currency/features/converter/domain/entities/keyboard_type.dart';
import 'package:crypto_currency/features/converter/presentation/widgets/keyboard_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class ConverterKeyboard extends StatelessWidget {
  const ConverterKeyboard({super.key});

  @override
  Widget build(BuildContext context) => LayoutGrid(
        columnSizes: [100.px, 100.px, 100.px],
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
          KeyboardButton(type: KeyboardType.one).inGridArea('one'),
          KeyboardButton(type: KeyboardType.two).inGridArea('two'),
          KeyboardButton(type: KeyboardType.three).inGridArea('three'),
          KeyboardButton(type: KeyboardType.four).inGridArea('four'),
          KeyboardButton(type: KeyboardType.five).inGridArea('five'),
          KeyboardButton(type: KeyboardType.six).inGridArea('six'),
          KeyboardButton(type: KeyboardType.seven).inGridArea('seven'),
          KeyboardButton(type: KeyboardType.eight).inGridArea('eight'),
          KeyboardButton(type: KeyboardType.nine).inGridArea('nine'),
          KeyboardButton(type: KeyboardType.dot).inGridArea('dot'),
          KeyboardButton(type: KeyboardType.zero).inGridArea('zero'),
          KeyboardButton(type: KeyboardType.remove).inGridArea('remove')
        ],
      );
}
