import 'package:bloc/bloc.dart';
import 'package:crypto_currency/features/main_coins_info/domain/repositories/main_coins_info_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'main_coins_info_event.dart';
part 'main_coins_info_state.dart';

class MainCoinInfoBloc extends Bloc<MainCoinsInfoEvent, MainCoinInfoState> {
  MainCoinInfoBloc({required this.repository})
      : super(MainCoinsInfoStateInitial()) {
    on<MainCoinsInfoEvent>((event, emit) async {});
  }

  final MainCoinsInfoRepository repository;
}
