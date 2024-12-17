import 'package:crypto_currency/features/converter/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
final class ConverterState extends Equatable {
  ConverterState(
      {required this.from,
      required this.to,
      required this.selectedType,
      required this.selectedCoinFrom,
      required this.selectedCoinTo});

  final String from;
  final String to;
  final String selectedCoinFrom;
  final String selectedCoinTo;
  ConverterSideType selectedType = Nothing();

  @override
  List<Object> get props =>
      [from, to, selectedType, selectedCoinFrom, selectedCoinTo];
  ConverterState copyWith({
    String? from,
    String? to,
    String? selectedCoinFrom,
    String? selectedCoinTo,
    ConverterSideType? selectedType,
  }) {
    return ConverterState(
        from: from ?? this.from,
        to: to ?? this.to,
        selectedType: selectedType ?? this.selectedType,
        selectedCoinFrom: selectedCoinFrom ?? this.selectedCoinFrom,
        selectedCoinTo: selectedCoinTo ?? this.selectedCoinTo);
  }
}
