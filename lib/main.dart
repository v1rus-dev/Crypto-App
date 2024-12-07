import 'package:crypto_currency/crypto_currency_app.dart';
import 'package:crypto_currency/data/api/crypto_compare_api.dart';
import 'package:crypto_currency/repositories/crypto_compare/abstract_coins_repository.dart';
import 'package:crypto_currency/repositories/crypto_compare/crypto_compare_repository.dart';
import 'package:crypto_currency/repositories/crypto_compare/models/crypto_coin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {

  GetIt.I.registerSingleton(Dio());
  GetIt.I.registerLazySingleton<AbstractCryptoCompareRepository>(() => CryptoCompareRepository(dio: GetIt.I.get()));
  GetIt.I.registerLazySingleton<CryptoCompareApi>(() => CryptoCompareApi());

  await Hive.initFlutter();

  Hive.registerAdapter(CryptoCoinAdapter());

  final allListBox = await Hive.openBox<CryptoCoin>('all_coins_list_box');

  GetIt.I.registerSingleton<Box<CryptoCoin>>(allListBox);

  runApp(const CryptoCurrencyApp());
}