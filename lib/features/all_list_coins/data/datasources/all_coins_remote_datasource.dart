import 'package:crypto_currency/data/api/api.dart';
import 'package:crypto_currency/data/api/dto/all_coins_info_dto.dart';

class AllCoinsRemoteDatasource {
  final CryptoCompareApi api;

  const AllCoinsRemoteDatasource({required this.api});

  Future<Iterable<AllCoinsInfoDTO>> loadAllCoins() async => api.getAllList();

}