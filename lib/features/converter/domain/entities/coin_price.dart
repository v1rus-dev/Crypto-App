import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_price.freezed.dart';

@freezed
class CoinPrice with _$CoinPrice {
  const factory CoinPrice({
    required String coinName,
    required String name,
    required String price,
  }) = _CoinPrice;
}
