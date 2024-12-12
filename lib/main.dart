import 'package:crypto_currency/common/favorites/domain/bloc/favorites_bloc.dart';
import 'package:crypto_currency/common/domain/settings/bloc/settings_bloc.dart';
import 'package:crypto_currency/crypto_currency_app.dart';
import 'package:crypto_currency/features/all_list_coins/domain/bloc/all_list_coins_bloc.dart';
import 'package:crypto_currency/inject_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await initLocator();

  Bloc.observer = TalkerBlocObserver(
      talker: locator(),
      settings: const TalkerBlocLoggerSettings(
          enabled: false, printStateFullData: true, printEventFullData: false));

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider.value(value: locator<SettingsBloc>()),
      BlocProvider.value(value: locator<FavoritesBloc>()),
      BlocProvider.value(value: locator<AllListCoinsBloc>()),
    ],
    child: CryptoCurrencyApp(),
  ));
}
