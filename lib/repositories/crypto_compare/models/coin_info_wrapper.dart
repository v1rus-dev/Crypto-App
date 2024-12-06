
import 'package:crypto_currency/repositories/crypto_compare/models/coin_info.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_info_wrapper.g.dart';

@JsonSerializable(createToJson: false)
class CoinInfoWrapper extends Equatable {
  @JsonKey(name: 'Response')
  final String response;
  @JsonKey(name: 'Data')
  @CoinInfoMapConverter()
  final Map<String, CoinInfo> data;

  const CoinInfoWrapper({required this.response, required this.data});

  factory CoinInfoWrapper.fromJson(Map<String, dynamic> json) => _$CoinInfoWrapperFromJson(json);

@override
List<Object?> get props => [response, data];
}

class CoinInfoMapConverter
    implements JsonConverter<Map<String, CoinInfo>, Map<String, dynamic>> {
  const CoinInfoMapConverter();

  @override
  Map<String, CoinInfo> fromJson(Map<String, dynamic> json) {
    return json.map((key, value) =>
        MapEntry(key, CoinInfo.fromJson(value as Map<String, dynamic>)));
  }

  @override
  Map<String, dynamic> toJson(Map<String, CoinInfo> object) {
    return object.map((key, value) => MapEntry(key, value.toJson()));
  }
}