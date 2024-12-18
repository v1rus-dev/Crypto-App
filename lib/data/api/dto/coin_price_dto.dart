import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_price_dto.freezed.dart';

@freezed
class CoinPriceDto with _$CoinPriceDto {
  factory CoinPriceDto({
    required String coinName,
    required double price,
  }) = _CoinPriceDto;
}
