import 'package:crypto_currency/features/main_coins_info/domain/entities/coin_info.dart';
import 'package:crypto_currency/features/main_coins_info/domain/repositories/main_coins_info_repository.dart';

class MainCoinsInfoRepositoryImpl implements MainCoinsInfoRepository {
  @override
  Stream<List<CoinInfo>> observeFavoriteCoins() => Stream.value(
      []..add(const CoinInfo(name: 'Test', coinName: 'Text coin')));
}
