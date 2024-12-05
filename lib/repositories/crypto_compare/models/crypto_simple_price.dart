import 'package:equatable/equatable.dart';

class CryptoSimplePrice extends Equatable {
  final String name;
  final double price;

  const CryptoSimplePrice({required this.name, required this.price});

  @override
  List<Object?> get props => [name, price];
}
