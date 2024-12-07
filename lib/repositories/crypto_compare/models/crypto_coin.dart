import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'crypto_coin.g.dart';

@HiveType(typeId: 1)
// ignore: must_be_immutable
class CryptoCoin extends Equatable {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String coinName;
  @HiveField(2)
  String? fullCoinName;
  @HiveField(3)
  final String algorithm;
  @HiveField(4)
  final bool isTrading;
  @HiveField(5)
  String? launchDate;
  @HiveField(6)
  final String? platformType;
  @HiveField(7)
  final String imageUrl;
  @HiveField(8)
  final double changePrcDay;

  CryptoCoin(
      {required this.name,
      required this.coinName,
      required this.algorithm,
      required this.isTrading,
      required this.imageUrl,
      required this.changePrcDay,
      this.fullCoinName,
      this.launchDate,
      this.platformType});

  @override
  List<Object?> get props => [
        name,
        coinName,
        fullCoinName,
        algorithm,
        isTrading,
        launchDate,
        platformType,
        imageUrl,
        changePrcDay
      ];
}
