import 'package:equatable/equatable.dart';

class CoinInfo extends Equatable {
  final String name;
  final String coinName;

  const CoinInfo({required this.name, required this.coinName});

  @override
  List<Object> get props => [name, coinName];
}
