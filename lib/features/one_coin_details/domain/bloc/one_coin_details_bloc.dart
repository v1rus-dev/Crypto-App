import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency/features/one_coin_details/domain/entities/coin_base_info.dart';
import 'package:crypto_currency/features/one_coin_details/domain/entities/coin_history_info.dart';
import 'package:crypto_currency/features/one_coin_details/domain/repository/one_coin_repository.dart';
import 'package:equatable/equatable.dart';

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
    on<OneCoinDetailsUpdateHistory>(_updateHistory);
  }

  Future<void> _loadDetailsData(OneCoinDetailsLoadData event,
      Emitter<OneCoinDetailsState> emitter) async {
    final localInfo = await repository.getLocalInfo(event.coinName);

    emitter.call(state.copyWith(
        coinName: localInfo.name, fullCoinName: localInfo.coinName));

    final coinInfo = await repository.load(event.coinName);

    emitter.call(state.copyWith(coinBaseInfo: coinInfo, isLoading: false));
  }

  Future<void> _updateHistory(OneCoinDetailsUpdateHistory event,
      Emitter<OneCoinDetailsState> emitter) async {
    final coinName = state.coinName;

    if (coinName.isEmpty) {
      return;
    }

    final historyMinute = await repository.loadHistoryForMinute(coinName);
    final historyHour = await repository.loadHistoryForHour(coinName);
    final historyDay = await repository.loadHistoryForDay(coinName);

    emitter.call(state.copyWith(
      historyInfoMinute: historyMinute.toList(),
      historyInfoHour: historyHour.toList(),
      historyInfoDay: historyDay.toList(),
    ));
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
