import 'package:equatable/equatable.dart';

class CoinLocalInfo extends Equatable {
  final String name;
  final String coinName;

  const CoinLocalInfo({required this.name, required this.coinName});

  @override
  List<Object?> get props => [name, coinName];
}
