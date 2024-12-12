import 'package:equatable/equatable.dart';

class CoinBaseInfo extends Equatable {
  final double price;
  final double hightDay;
  final double lowDay;
  final double changePrcDay;
  final double totalVolumeOfDay;

  const CoinBaseInfo({
    required this.price,
    required this.hightDay,
    required this.lowDay,
    required this.changePrcDay,
    required this.totalVolumeOfDay,
  });

  @override
  List<Object?> get props =>
      [price, hightDay, lowDay, changePrcDay, totalVolumeOfDay];

  static CoinBaseInfo empty = const CoinBaseInfo(
      price: 0, hightDay: 0, lowDay: 0, changePrcDay: 0, totalVolumeOfDay: 0);
}
