import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'one_coin_info_entity.g.dart';

@JsonSerializable(createToJson: false)
class OneCoinInfoEntity extends Equatable {
  @JsonKey(name: 'PRICE')
  final double price;
  @JsonKey(name: 'HIGHDAY')
  final double highDay;
  @JsonKey(name: 'LOWDAY')
  final double lowDay;
  @JsonKey(name: 'CHANGEPCTDAY')
  final double changePrcDay;
  @JsonKey(name: 'TOTALVOLUME24H')
  final double totalVoduleOfDay;

  const OneCoinInfoEntity(
      {required this.price,
      required this.highDay,
      required this.lowDay,
      required this.changePrcDay,
      required this.totalVoduleOfDay});

  factory OneCoinInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$OneCoinInfoEntityFromJson(json);

  @override
  List<Object?> get props =>
      [price, highDay, lowDay, changePrcDay, totalVoduleOfDay];
}
