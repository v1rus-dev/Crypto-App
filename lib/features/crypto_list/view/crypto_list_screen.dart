import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_currency/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_currency/features/crypto_list/widgets/empty_selected_crypto_list.dart';
import 'package:crypto_currency/widgets/main_appbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => CryptoListScreenState();
}

class CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc();

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
        body: RefreshIndicator.adaptive(
            onRefresh: () async {
              final completer = Completer();
              _cryptoListBloc.add(LoadCryptoList(completer: completer));
              return completer.future;
            },
            child: BlocBuilder<CryptoListBloc, CryptoListState>(
                bloc: _cryptoListBloc,
                builder: (context, state) {
                  return const EmptySelectedCryptoList();
                })));
  }
}
