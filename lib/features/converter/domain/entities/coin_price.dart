import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_price.freezed.dart';

@freezed
class CoinPrice with _$CoinPrice {
  const factory CoinPrice({
    required String coinName,
    required double price,
  }) = _CoinPrice;
}
