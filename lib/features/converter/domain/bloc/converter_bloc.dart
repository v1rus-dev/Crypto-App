import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency/features/converter/domain/bloc/converter_state.dart';
import 'package:crypto_currency/features/converter/domain/entities/entities.dart';
import 'package:crypto_currency/features/converter/domain/entities/load_coins_price_for.dart';
import 'package:crypto_currency/features/converter/domain/repositories/converter_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'converter_event.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  ConverterBloc({required this.repository})
      : super(ConverterState(
          from: '',
          to: '',
          selectedType: Nothing(),
          selectedCoinFrom: 'BTC',
          selectedCoinTo: 'ETH',
          loadPriceForTo: false,
          loadPriceForFrom: false,
        )) {
    on<SetSelectedType>(_setSelected);
    on<ClearSelected>(_clearSelected);
    on<SetCoinType>(_processSetCoinType);
    on<OnKeyboardTap>(_processKeyboardEvent);
    on<LoadCoinsPrices>(_loadCoinPrices);
  }

  _setSelected(SetSelectedType event, Emitter<ConverterState> emitter) {
    emitter.call(state.copyWith(selectedType: event.type));
  }

  _clearSelected(ClearSelected event, Emitter<ConverterState> emitter) {
    emitter.call(state.copyWith(selectedType: Nothing()));
  }

  _processSetCoinType(SetCoinType event, Emitter<ConverterState> emitter) {
    if (event.type is FromSide) {
      emitter.call(state.copyWith(selectedCoinFrom: event.coin));
      add(LoadCoinsPrices(priceFor: LoadCoinsPriceFrom()));
    } else if (event.type is ToSide) {
      emitter.call(state.copyWith(selectedCoinTo: event.coin));
      add(LoadCoinsPrices(priceFor: LoadCoinsPriceTo()));
    }
  }

  _processKeyboardEvent(OnKeyboardTap event, Emitter<ConverterState> emitter) {
    switch (state.selectedType) {
      case Nothing():
        return;
      case FromSide():
        {
          final newNumber = _processEvent(event.type, state.from);
          emitter.call(
            state.copyWith(
                from: newNumber,
                to: getConvertedPriceFor(
                  newNumber,
                  state.selectedCoinFrom,
                  state.selectedCoinTo,
                ).toStringAsFixed(6)),
          );
        }
      case ToSide():
        {
          final newNumber = _processEvent(event.type, state.to);
          emitter.call(state.copyWith(
            to: newNumber,
            from: getConvertedPriceFor(
              newNumber,
              state.selectedCoinTo,
              state.selectedCoinFrom,
            ).toStringAsFixed(6),
          ));
        }
    }
  }

  double getConvertedPriceFor(
      String enteredPrice, String enteredCoin, String otherCoin) {
    if (enteredPrice.isEmpty) return 0;
    final _enteredPrice = double.parse(enteredPrice);
    final _priceOfOneEnteredCoin = priceHashMap[enteredCoin] ?? 0;
    final _priceOfOtherCoin = priceHashMap[otherCoin] ?? 0;

    if (_priceOfOneEnteredCoin == _priceOfOtherCoin) {
      return _enteredPrice;
    }

    return _enteredPrice * (_priceOfOneEnteredCoin / _priceOfOtherCoin);
  }

  String _processEvent(KeyboardType type, String currentString) {
    String result = currentString;

    switch (type) {
      case KeyboardType.zero:
        result = '${result}0';
      case KeyboardType.one:
        result = '${result}1';
      case KeyboardType.two:
        result = '${result}2';
      case KeyboardType.three:
        result = '${result}3';
      case KeyboardType.four:
        result = '${result}4';
      case KeyboardType.five:
        result = '${result}5';
      case KeyboardType.six:
        result = '${result}6';
      case KeyboardType.seven:
        result = '${result}7';
      case KeyboardType.eight:
        result = '${result}8';
      case KeyboardType.nine:
        result = '${result}9';
      case KeyboardType.dot:
        {
          if (!result.contains('.')) {
            result = '${result}.';
          }
        }
      case KeyboardType.remove:
        {
          {
            debugPrint("remove: $result");
            if (result.isNotEmpty) {
              List<String> c = result.split("");
              c.removeLast();
              result = c.join();
            }
          }
        }
    }

    return result;
  }

  _loadCoinPrices(
      LoadCoinsPrices event, Emitter<ConverterState> emitter) async {
    if (event.priceFor is LoadCoinsPriceFrom) {
      emitter.call(state.copyWith(loadPriceForFrom: true));
    } else if (event.priceFor is LoadCoinsPriceTo) {
      emitter.call(state.copyWith(loadPriceForTo: true));
    }
    debugPrint('Load coin price: $event');
    final result = await repository.fetchPrices(_getCoinNames());
    debugPrint('Res: $result');

    for (var coinPrice in result) {
      priceHashMap[coinPrice.coinName] = coinPrice.price;
    }

    emitter.call(state.copyWith(loadPriceForFrom: false, loadPriceForTo: false));
  }

  List<String> _getCoinNames() {
    final result = <String>[];

    result.add(state.selectedCoinFrom);
    result.add(state.selectedCoinTo);

    return result;
  }

  final ConverterRepository repository;

  final priceHashMap = HashMap<String, double>();
}
