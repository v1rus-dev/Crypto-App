import 'package:crypto_currency/crypto_currency_app.dart';
import 'package:crypto_currency/repositories/crypto_compare/abstract_coins_repository.dart';
import 'package:crypto_currency/repositories/crypto_compare/crypto_compare_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {

  GetIt.I.registerSingleton(Dio());
  GetIt.I.registerLazySingleton<AbstractCryptoCompareRepository>(() => CryptoCompareRepository(dio: GetIt.I.get()));

  runApp(const CryptoCurrencyApp());
}