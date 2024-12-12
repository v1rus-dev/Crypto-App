import 'package:crypto_currency/data/api/crypto_compare_api.dart';
import 'package:crypto_currency/data/api/dto/one_coin_info_dto.dart';
import 'package:get_it/get_it.dart';

class OneCoinNetworkDatasource {
  CryptoCompareApi api = GetIt.I.get();

  Future<OneCoinInfoDTO> loadCoinInfo(String coinName) async => api.getOneCoinInfo(coinName);
}