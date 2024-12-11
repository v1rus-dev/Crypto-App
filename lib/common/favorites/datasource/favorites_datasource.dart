import 'package:crypto_currency/common/utils/local_datasource.dart';
import 'package:crypto_currency/data/database/entities/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FavoritesDatasource extends LocalDatasource<CryptoCoin> {
  FavoritesDatasource() : super(dataBox: GetIt.I.get());

  Future<void> addCryptoCoinToFavorite(CryptoCoin coin) async {
    coin.isFavorite = true;
    coin.save();
  }

  Future<void> removeCryptoCoinFromFavorite(CryptoCoin coin) async {
    coin.isFavorite = false;
    coin.save();
  }
}
