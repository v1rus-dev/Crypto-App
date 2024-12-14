import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_currency/features/main_coins_info/domain/bloc/main_coins_info_bloc.dart';
import 'package:crypto_currency/features/main_coins_info/presentation/widgets/empty_selected_crypto_list.dart';
import 'package:crypto_currency/inject_container.dart';
import 'package:crypto_currency/widgets/main_appbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class MainCoinsInfoScreen extends StatefulWidget {
  const MainCoinsInfoScreen({super.key});

  @override
  State<MainCoinsInfoScreen> createState() => MainCoinsInfoScreenState();
}

class MainCoinsInfoScreenState extends State<MainCoinsInfoScreen> {
  final _cryptoListBloc = MainCoinInfoBloc(repository: locator.get());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: MainAppbar(
        title: "Next.io".toUpperCase(),
        actions: kDebugMode
            ? [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              TalkerScreen(talker: GetIt.I.get<Talker>())));
                    },
                    icon: const Icon(Icons.settings))
              ]
            : null,
      ),
      body: const CustomScrollView(),
    );
  }
}
