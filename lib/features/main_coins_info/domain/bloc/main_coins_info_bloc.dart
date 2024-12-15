import 'package:bloc/bloc.dart';
import 'package:crypto_currency/features/main_coins_info/domain/entities/coin_info.dart';
import 'package:crypto_currency/features/main_coins_info/domain/repositories/main_coins_info_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'main_coins_info_event.dart';
part 'main_coins_info_state.dart';

class MainCoinInfoBloc extends Bloc<MainCoinsInfoEvent, MainCoinInfoState> {
  MainCoinInfoBloc({required this.repository})
      : super(MainCoinsInfoStateInitial()) {
    on<MainCoinsInfoEvent>((event, emit) async {});
    on<GetFavoriteCoinsEvent>(_getFavoriteCoins);
  }

  Future<void> _getFavoriteCoins(
      GetFavoriteCoinsEvent event, Emitter<MainCoinInfoState> emitter) async {
    final values = await repository.getFavoriteCoins();
    if (state is MainCoinsInfoStateInitial) {
      emitter(ListOfCoins(coins: values));
      return;
    }

    if (state is ListOfCoins) {
      emitter((state as ListOfCoins).copyWith(coins: values));
    }
  }

  final MainCoinsInfoRepository repository;
}
