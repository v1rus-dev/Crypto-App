import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency/features/one_coin_details/domain/entities/coin_base_info.dart';
import 'package:crypto_currency/features/one_coin_details/domain/entities/coin_history_info.dart';
import 'package:crypto_currency/features/one_coin_details/domain/repository/one_coin_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'one_coin_details_event.dart';
part 'one_coin_details_state.dart';

class OneCoinDetailsBloc
    extends Bloc<OneCoinDetailsEvent, OneCoinDetailsState> {
  final OneCoinRepository repository;

  Timer? timer;

  OneCoinDetailsBloc({required this.repository})
      : super(
          OneCoinDetailsState(
            coinName: '',
            fullCoinName: '',
            isLoading: true,
            coinBaseInfo: CoinBaseInfo.empty,
            historyInfoMinute: List.empty(),
            historyInfoHour: List.empty(),
            historyInfoDay: List.empty(),
          ),
        ) {
    on<OneCoinDetailsLoadData>(_loadDetailsData);
  }

  Future<void> _loadDetailsData(OneCoinDetailsLoadData event,
      Emitter<OneCoinDetailsState> emitter) async {
    final localInfo = await repository.getLocalInfo(event.coinName);

    emitter.call(state.copyWith(
        coinName: localInfo.name, fullCoinName: localInfo.coinName));

    final coinInfo = await repository.load(event.coinName);

    emitter.call(state.copyWith(coinBaseInfo: coinInfo, isLoading: false));
    debugPrint('CoinInfo: ${coinInfo.toString()}');
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
