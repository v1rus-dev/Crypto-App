import 'package:crypto_currency/features/converter/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
final class ConverterState extends Equatable {
  ConverterState(
      {required this.from,
      required this.to,
      required this.selectedType,
      required this.selectedCoinFrom,
      required this.selectedCoinTo,
      required this.loadPriceForFrom,
      required this.loadPriceForTo});

  final String from;
  final String to;
  final String selectedCoinFrom;
  final String selectedCoinTo;
  ConverterSideType selectedType = Nothing();
  final bool loadPriceForFrom;
  final bool loadPriceForTo;

  @override
  List<Object> get props => [
        from,
        to,
        selectedType,
        selectedCoinFrom,
        selectedCoinTo,
        loadPriceForFrom,
        loadPriceForTo
      ];
  ConverterState copyWith(
      {String? from,
      String? to,
      String? selectedCoinFrom,
      String? selectedCoinTo,
      ConverterSideType? selectedType,
      bool? loadPriceForFrom,
      bool? loadPriceForTo}) {
    return ConverterState(
      from: from ?? this.from,
      to: to ?? this.to,
      selectedType: selectedType ?? this.selectedType,
      selectedCoinFrom: selectedCoinFrom ?? this.selectedCoinFrom,
      selectedCoinTo: selectedCoinTo ?? this.selectedCoinTo,
      loadPriceForFrom: loadPriceForFrom ?? this.loadPriceForFrom,
      loadPriceForTo: loadPriceForTo ?? this.loadPriceForTo,
    );
  }
}
