part of 'converter_bloc.dart';

sealed class ConverterEvent extends Equatable {
  const ConverterEvent();
}

final class SetSelectedType extends ConverterEvent {
  final ConverterSideType type;

  const SetSelectedType({required this.type});

  @override
  List<Object> get props => [type];
}

final class ClearSelected extends ConverterEvent {
  @override
  List<Object> get props => [];
}

final class OnKeyboardTap extends ConverterEvent {
  final KeyboardType type;

  const OnKeyboardTap({required this.type});

  @override
  List<Object> get props => [type];
}

final class SetCoinType extends ConverterEvent {
  final ConverterSideType type;
  final String coin;

  const SetCoinType({required this.type, required this.coin});

  @override
  List<Object> get props => [type, coin];
}
