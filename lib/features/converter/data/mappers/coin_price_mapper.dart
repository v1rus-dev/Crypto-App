import 'package:crypto_currency/data/api/dto/coin_price_dto.dart';

import '../../domain/entities/coin_price.dart';

class CoinPriceMapper {
  static CoinPrice mapFromNetwork(CoinPriceDto dto) => CoinPrice(coinName: dto.coinName, price: dto.price);
}