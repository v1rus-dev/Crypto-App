import 'package:crypto_currency/common/domain/settings/bloc/settings_bloc.dart';
import 'package:crypto_currency/common/favorites/data/datasource/favorites_datasource.dart';
import 'package:crypto_currency/common/favorites/data/repository_impl/favorites_repository_impl.dart';
import 'package:crypto_currency/common/favorites/domain/bloc/favorites_bloc.dart';
import 'package:crypto_currency/common/favorites/domain/repository/repository.dart';
import 'package:crypto_currency/data/api/dio_service.dart';
import 'package:crypto_currency/data/database/database.dart';
import 'package:crypto_currency/features/all_list_coins/data/datasources/datasources.dart';
import 'package:crypto_currency/features/all_list_coins/data/repository_impl/all_list_reposiory_impl.dart';
import 'package:crypto_currency/features/all_list_coins/domain/bloc/all_list_coins_bloc.dart';
import 'package:crypto_currency/features/all_list_coins/domain/repository/repository.dart';
import 'package:crypto_currency/features/one_coin_details/data/repository_impl/one_coin_repository_impl.dart';
import 'package:crypto_currency/features/one_coin_details/domain/repository/one_coin_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'data/api/crypto_compare_api.dart';
import 'data/database/dto/crypto_coin_local_dto.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  _initLogger(true);
  await _initHive();
  _initCore();
  _initApi();
  _initAllCoins();
  _initFavorites();
  _initOneCoinInfo();
}

void _initLogger(bool enable) {
  final talker = TalkerFlutter.init(settings: TalkerSettings(enabled: enable));
  locator.registerSingleton(talker);
}

void _initCore() {
  locator.registerLazySingleton(() => SettingsBloc());
}

void _initApi() {
  locator.registerSingleton(Dio());
  final clientProvider = locator.registerSingleton(DioService());
  locator.registerLazySingleton<CryptoCompareApi>(
    () => CryptoCompareApi(dioService: clientProvider),
  );
}

Future<void> _initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(CryptoCoinLocalDTOAdapter());

  final allListBox = await Hive.openBox<CryptoCoinLocalDTO>(
      DatabaseConstants.cryptoCoinLocalDTOName);
  locator.registerSingleton<Box<CryptoCoinLocalDTO>>(allListBox);
  return Future(() {});
}

_initAllCoins() {
  locator.registerLazySingleton(() => AllCoinsLocalDatasource());
  locator.registerLazySingleton(
    () => AllCoinsRemoteDatasource(
      api: locator.get(),
    ),
  );
  locator.registerLazySingleton<AllListRepository>(
    () => AllListReposioryImpl(
      localDatasource: locator.get(),
      remoteDatasource: locator.get(),
    ),
  );
  locator.registerLazySingleton<AllListCoinsBloc>(
    () => AllListCoinsBloc(
      repository: locator(),
    ),
  );
}

_initOneCoinInfo() {
  locator.registerFactory<OneCoinRepository>(() => OneCoinRepositoryImpl());
}

_initFavorites() {
  locator.registerLazySingleton(() => FavoritesDatasource(dataBox: locator()));
  locator.registerLazySingleton(() => FavoritesBloc(repository: locator()));
  locator.registerLazySingleton<FavoritesRepository>(
      () => FavoritesRepositoryImpl(datasource: locator()));
}
