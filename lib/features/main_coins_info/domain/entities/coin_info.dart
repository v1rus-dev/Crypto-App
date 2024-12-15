import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_info.freezed.dart';

@freezed
class CoinInfo with _$CoinInfo {
  const factory CoinInfo({required String name, required String coinName}) =
      _CoinInfo;
}
