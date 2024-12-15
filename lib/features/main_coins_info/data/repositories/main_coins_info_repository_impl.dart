import 'package:crypto_currency/common/utils/future_list_ext.dart';
import 'package:crypto_currency/features/main_coins_info/data/datasource/datasource.dart';
import 'package:crypto_currency/features/main_coins_info/domain/entities/coin_info.dart';
import 'package:crypto_currency/features/main_coins_info/domain/repositories/main_coins_info_repository.dart';

class MainCoinsInfoRepositoryImpl implements MainCoinsInfoRepository {
  final LocalMainCoinsInfoDatasource localDatasource =
      LocalMainCoinsInfoDatasource();

  @override
  Future<List<CoinInfo>> getFavoriteCoins() async {
    final result =
        await localDatasource.getFavoriteCoins().mapList<CoinInfo>((item) {
      return CoinInfo(coinName: item.coinName, name: item.name);
    });
    return result.toList();
  }
}
