import 'package:equatable/equatable.dart';

class CoinEntity extends Equatable {
  final String coinName;
  final String name;
  final String fullName;

  const CoinEntity({
    required this.coinName,
    required this.name,
    required this.fullName,
  });

  @override
  List<Object?> get props => [coinName, name, fullName];
}
