import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'crypto_coin.g.dart';

@HiveType(typeId: 1)
// ignore: must_be_immutable
class CryptoCoin extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String coinName;
  @HiveField(2)
  String? fullCoinName;
  @HiveField(3)
  String algorithm;
  @HiveField(4)
  bool isTrading;
  @HiveField(5)
  String? launchDate;
  @HiveField(6)
  String? platformType;
  @HiveField(8)
  double changePrcDay;
  @HiveField(9, defaultValue: false)
  bool isFavorite;

  CryptoCoin(
      {required this.name,
      required this.coinName,
      required this.algorithm,
      required this.isTrading,
      required this.changePrcDay,
      required this.isFavorite,
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
        changePrcDay,
        isFavorite
      ];
}
