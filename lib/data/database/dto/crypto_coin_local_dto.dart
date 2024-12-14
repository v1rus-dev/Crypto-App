import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'crypto_coin_local_dto.g.dart';

@HiveType(typeId: 1)
// ignore: must_be_immutable
class CryptoCoinLocalDTO extends HiveObject {
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
  @HiveField(7, defaultValue: false)
  bool isFavorite;

  CryptoCoinLocalDTO(
      {required this.name,
      required this.coinName,
      required this.algorithm,
      required this.isTrading,
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
        isFavorite
      ];
  CryptoCoinLocalDTO copyWith(
      {String? name,
      String? coinName,
      ValueGetter<String?>? fullCoinName,
      String? algorithm,
      bool? isTrading,
      ValueGetter<String?>? launchDate,
      ValueGetter<String?>? platformType,
      bool? isFavorite}) {
    return CryptoCoinLocalDTO(
        name: name ?? this.name,
        coinName: coinName ?? this.coinName,
        fullCoinName: fullCoinName != null ? fullCoinName() : this.fullCoinName,
        algorithm: algorithm ?? this.algorithm,
        isTrading: isTrading ?? this.isTrading,
        launchDate: launchDate != null ? launchDate() : this.launchDate,
        platformType: platformType != null ? platformType() : this.platformType,
        isFavorite: isFavorite ?? this.isFavorite);
  }
}
