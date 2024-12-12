import 'package:crypto_currency/data/api/dto/dto.dart';
import 'package:crypto_currency/data/database/dto/crypto_coin_local_dto.dart';
import 'package:crypto_currency/features/all_list_coins/domain/entities/entities.dart';

class CoinEntityMapper {
  static CoinEntity fromDTO(CryptoCoinLocalDTO dto) => CoinEntity(
      coinName: dto.coinName, name: dto.name, fullName: dto.fullCoinName ?? '');

  static CryptoCoinLocalDTO fromNetworkToLocal(AllCoinsInfoDTO dto) => CryptoCoinLocalDTO(
        name: dto.name,
        coinName: dto.coinName,
        algorithm: dto.algorithm,
        isTrading: dto.isTrading,
        isFavorite: false,
      );
}
