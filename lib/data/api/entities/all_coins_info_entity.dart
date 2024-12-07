import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_coins_info_entity.g.dart';

@JsonSerializable(
    createToJson: false, explicitToJson: true, includeIfNull: false)
class AllCoinsInfoEntity extends Equatable {
  @JsonKey(name: 'Name')
  final String name;
  @JsonKey(name: 'CoinName')
  final String coinName;
  @JsonKey(name: 'FullCoinName')
  String? fullCoinName;
  @JsonKey(name: 'Algorithm')
  final String algorithm;
  @JsonKey(name: 'IsTrading')
  final bool isTrading;
  @JsonKey(name: 'AssetLaunchDate')
  String? launchDate;
  @JsonKey(name: 'PlatformType')
  final String? platformType;

  AllCoinsInfoEntity(
      {required this.name,
      required this.coinName,
      required this.fullCoinName,
      required this.algorithm,
      required this.isTrading,
      required this.launchDate,
      required this.platformType});

  factory AllCoinsInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$AllCoinsInfoEntityFromJson(json);

  @override
  List<Object?> get props => [
        name,
        coinName,
        fullCoinName,
        algorithm,
        isTrading,
        launchDate,
        platformType
      ];
}
