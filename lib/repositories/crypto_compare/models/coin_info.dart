import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_info.g.dart';

@JsonSerializable()
class CoinInfo extends Equatable {
  @JsonKey(name: 'Name')
  final String name;
  @JsonKey(name: 'CoinName')
  final String coinName;
  @JsonKey(name: 'FullName')
  final String fullName;
  @JsonKey(name: 'Description')
  final String description;

  const CoinInfo(
      {required this.name,
      required this.coinName,
      required this.fullName,
      required this.description});

  factory CoinInfo.fromJson(Map<String, dynamic> json) =>
      _$CoinInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CoinInfoToJson(this);

  @override
  List<Object?> get props => [name, coinName, fullName, description];
}
