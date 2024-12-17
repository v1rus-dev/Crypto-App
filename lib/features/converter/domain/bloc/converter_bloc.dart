import 'package:bloc/bloc.dart';
import 'package:crypto_currency/features/converter/domain/bloc/converter_state.dart';
import 'package:crypto_currency/features/converter/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

part 'converter_event.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  ConverterBloc()
      : super(ConverterState(
          from: '',
          to: '',
          selectedType: Nothing(),
          selectedCoinFrom: 'BTC',
          selectedCoinTo: 'ETH',
        )) {
    on<SetSelectedType>(_setSelected);
    on<ClearSelected>(_clearSelected);
    on<SetCoinType>(_processSetCoinType);
    on<OnKeyboardTap>(_processKeyboardEvent);
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
    } else if (event.type is ToSide) {
      emitter.call(state.copyWith(selectedCoinTo: event.coin));
    }
  }

  _processKeyboardEvent(OnKeyboardTap event, Emitter<ConverterState> emitter) {
    switch (state.selectedType) {
      case Nothing():
        return;
      case FromSide():
        emitter
            .call(state.copyWith(from: _processEvent(event.type, state.from)));
      case ToSide():
        emitter.call(state.copyWith(to: _processEvent(event.type, state.to)));
    }
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
}
