import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_full_data.g.dart';

@JsonSerializable(createToJson: false)
class CoinFullData extends Equatable {
  @JsonKey(name: 'FROMSYMBOL')
  final String coinName;
  @JsonKey(name: 'PRICE')
  final double price;
  @JsonKey(name: 'LOWDAY')
  final double lowDayPrice;
  @JsonKey(name: 'HIGHDAY')
  final double hightDayPrice;

  const CoinFullData(
      {required this.coinName,
      required this.price,
      required this.lowDayPrice,
      required this.hightDayPrice});

  factory CoinFullData.fromJson(Map<String, dynamic> json) =>
      _$CoinFullDataFromJson(json);

  @override
  List<Object?> get props => [coinName, price, lowDayPrice, hightDayPrice];
}
