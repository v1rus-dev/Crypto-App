import 'package:crypto_currency/features/all_list_coins/domain/entities/entities.dart';

abstract class AllListRepository {
  Future<List<CoinEntity>> getAllList();

  bool databaseIsEmpty();

  Future<void> loadCoins();
}