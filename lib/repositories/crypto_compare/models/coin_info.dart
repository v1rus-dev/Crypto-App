import 'package:equatable/equatable.dart';

class CoinInfo extends Equatable {
  final String name;
  final String coinName;
  final String fullName;
  final String description;

  const CoinInfo(
      {required this.name,
      required this.coinName,
      required this.fullName,
      required this.description});

  @override
  List<Object?> get props => [name, coinName, fullName, description];
}
