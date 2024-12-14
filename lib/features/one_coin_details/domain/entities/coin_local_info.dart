import 'package:equatable/equatable.dart';

class CoinLocalInfo extends Equatable {
  final String name;
  final String coinName;
  final bool isFavorite;

  const CoinLocalInfo({required this.name, required this.coinName, required this.isFavorite});

  @override
  List<Object?> get props => [name, coinName, isFavorite];
}
