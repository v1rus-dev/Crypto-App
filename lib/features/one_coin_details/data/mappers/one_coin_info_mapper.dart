import 'package:crypto_currency/data/api/dto/history/coin_history_dto.dart';
import 'package:crypto_currency/data/api/dto/one_coin_info_dto.dart';
import 'package:crypto_currency/data/database/dto/crypto_coin_local_dto.dart';
import 'package:crypto_currency/features/one_coin_details/domain/entities/coin_base_info.dart';
import 'package:crypto_currency/features/one_coin_details/domain/entities/coin_history_info.dart';
import 'package:crypto_currency/features/one_coin_details/domain/entities/coin_local_info.dart';

class OneCoinInfoMapper {
  static CoinLocalInfo mapFromDatabase(CryptoCoinLocalDTO dto) => CoinLocalInfo(
      name: dto.name, coinName: dto.coinName, isFavorite: dto.isFavorite);

  static CoinBaseInfo mapBaseInfoFromNetwork(OneCoinInfoDTO dto) =>
      CoinBaseInfo(
        price: dto.price,
        hightDay: dto.highDay,
        lowDay: dto.lowDay,
        changePrcDay: dto.changePrcDay,
        totalVolumeOfDay: dto.totalVoduleOfDay,
      );

  static CoinHistoryInfo mapHistoryFromNetwork(CoinHistoryDTO dto) =>
      CoinHistoryInfo(time: dto.time, high: dto.high, low: dto.low);
}
