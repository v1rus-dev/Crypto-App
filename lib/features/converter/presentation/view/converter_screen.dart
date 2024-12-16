import 'package:auto_route/auto_route.dart';
import 'package:crypto_currency/common/presentation/utils/context_ext.dart';
import 'package:crypto_currency/features/converter/domain/bloc/converter_bloc.dart';
import 'package:crypto_currency/features/converter/domain/entities/keyboard_type.dart';
import 'package:crypto_currency/features/converter/presentation/widgets/keyboard_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

@RoutePage()
class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final ConverterBloc bloc = ConverterBloc();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.lang.converter),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    Row(
                      children: [Text("data")],
                    )
                  ],
                ),
                LayoutGrid(
                  columnSizes: [100.px, auto, auto],
                  rowSizes: const [
                    auto,
                    auto,
                    auto,
                    auto,
                  ],
                  areas: '''
    one two  three
    four    five six
    seven    eight nine
    dot zero  remove
  ''',
                  columnGap: 12,
                  rowGap: 12,
                  children: [
                    KeyboardButton(type: KeyboardType.one).inGridArea('one'),
                    KeyboardButton(type: KeyboardType.two).inGridArea('two'),
                    KeyboardButton(type: KeyboardType.three)
                        .inGridArea('three'),
                    KeyboardButton(type: KeyboardType.four).inGridArea('four'),
                    KeyboardButton(type: KeyboardType.five).inGridArea('five'),
                    KeyboardButton(type: KeyboardType.six).inGridArea('six'),
                    KeyboardButton(type: KeyboardType.seven)
                        .inGridArea('seven'),
                    KeyboardButton(type: KeyboardType.eight)
                        .inGridArea('eight'),
                    KeyboardButton(type: KeyboardType.nine).inGridArea('nine'),
                    KeyboardButton(type: KeyboardType.dot).inGridArea('dot'),
                    KeyboardButton(type: KeyboardType.zero).inGridArea('zero'),
                    KeyboardButton(type: KeyboardType.remove)
                        .inGridArea('remove')
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
