import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency/repositories/crypto_compare/crypto_compare.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'crypto_all_list_event.dart';
part 'crypto_all_list_state.dart';

class CryptoAllListBloc extends Bloc<CryptoAllListEvent, CryptoAllListState> {
  final AbstractCryptoCompareRepository cryptoCompareRepository;
  CryptoAllListBloc({required this.cryptoCompareRepository})
      : super(CryptoAllListInitial()) {
    on<CryptoAllListEvent>((event, emit) async {
      switch (event) {
        case LoadAllList():
          {
            try {
              if (state == CryptoAllListInitial) {
                emit.call(CryptoAllListLoading());
              }

              final list = await cryptoCompareRepository.getAllCoins();
            } catch (e) {
              debugPrint(e.toString());
              emit.call(CryptoAllListErrorLoading(e as Error));
            } finally {
              event.completer?.complete();
            }
          }
      }
    });
  }
}
