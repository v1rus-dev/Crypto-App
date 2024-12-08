import 'package:crypto_currency/common/settings/bloc/settings_bloc.dart';
import 'package:crypto_currency/crypto_currency_app.dart';
import 'package:crypto_currency/data/api/crypto_compare_api.dart';
import 'package:crypto_currency/repositories/crypto_compare/abstract_coins_repository.dart';
import 'package:crypto_currency/repositories/crypto_compare/crypto_compare_repository.dart';
import 'package:crypto_currency/repositories/crypto_compare/models/crypto_coin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton(Dio());
  GetIt.I.registerLazySingleton<AbstractCryptoCompareRepository>(
      () => CryptoCompareRepository(dio: GetIt.I.get()));
  GetIt.I.registerLazySingleton<CryptoCompareApi>(() => CryptoCompareApi());

  const allListCoinsBox = 'all_coins_list_box';

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Hive.initFlutter();

  Hive.registerAdapter(CryptoCoinAdapter());

  final allListBox = await Hive.openBox<CryptoCoin>(allListCoinsBox);

  GetIt.I.registerSingleton<Box<CryptoCoin>>(allListBox);

  runApp(MultiBlocProvider(providers: [
    BlocProvider<SettingsBloc>(
      create: (BuildContext context) => SettingsBloc(),
    )
  ], child: CryptoCurrencyApp()));
}
