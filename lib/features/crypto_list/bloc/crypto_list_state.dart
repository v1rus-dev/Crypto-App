part of 'crypto_list_bloc.dart';

@immutable
sealed class CryptoListState {}

final class CryptoListInitial extends CryptoListState {}

final class CryptoListLoading extends CryptoListState {}

class CryptoListSuccess extends CryptoListState {
  final List<CryptoCoin> coinsList;

  CryptoListSuccess({required this.coinsList});
}

final class CryptoListLoadingFailure extends CryptoListState {
  final Object? exception;

  CryptoListLoadingFailure({required this.exception});
}