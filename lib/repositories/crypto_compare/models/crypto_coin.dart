import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  final String name;
  final double priceInUSD;
  final String imageUrl;
  final double changePrcDay;

  const CryptoCoin(
      {required this.name,
      required this.priceInUSD,
      required this.imageUrl,
      required this.changePrcDay});

  @override
  List<Object?> get props => [name, priceInUSD, imageUrl, changePrcDay];
}
