import 'package:crypto_currency/data/database/dto/crypto_coin_local_dto.dart';
import 'package:crypto_currency/features/search_coin/domain/entities/search_coin.dart';

class SearchMapper {
  static SearchCoin mapFromDatabase(CryptoCoinLocalDTO value) =>
      SearchCoin(name: value.name, coinName: value.coinName);
}
