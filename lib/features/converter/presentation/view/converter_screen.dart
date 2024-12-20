import 'package:auto_route/auto_route.dart';
import 'package:crypto_currency/common/presentation/utils/context_ext.dart';
import 'package:crypto_currency/features/converter/domain/bloc/converter_bloc.dart';
import 'package:crypto_currency/features/converter/domain/entities/load_coins_price_for.dart';
import 'package:crypto_currency/features/converter/presentation/widgets/converter_info.dart';
import 'package:crypto_currency/features/converter/presentation/widgets/converter_keyboard.dart';
import 'package:crypto_currency/inject_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

@RoutePage()
class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final ConverterBloc bloc = ConverterBloc(repository: locator())
    ..add(LoadCoinsPrices(priceFor: LoadCoinsPriceInitial()));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.lang.converter),
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Gap(20),
                ConverterInfo(),
                Spacer(),
                ConverterKeyboard(),
                Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
