import 'package:equatable/equatable.dart';

class SearchCoin extends Equatable {
  final String name;
  final String coinName;

  const SearchCoin({required this.name, required this.coinName});

  @override
  List<Object?> get props => [name, coinName];
}
