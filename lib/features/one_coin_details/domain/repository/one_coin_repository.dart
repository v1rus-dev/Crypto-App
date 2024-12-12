import 'package:crypto_currency/features/one_coin_details/domain/entities/coin_base_info.dart';
import 'package:crypto_currency/features/one_coin_details/domain/entities/coin_history_info.dart';
import 'package:crypto_currency/features/one_coin_details/domain/entities/coin_local_info.dart';

abstract class OneCoinRepository {

  Future<CoinBaseInfo> load(String coinName);

  Future<CoinLocalInfo> getLocalInfo(String coinName);

  Future<List<CoinHistoryInfo>> loadHistoryForMinute(String coinName);

  Future<List<CoinHistoryInfo>> loadHistoryForHour(String coinName);

  Future<List<CoinHistoryInfo>> loadHistoryForDay(String coinName);
}
