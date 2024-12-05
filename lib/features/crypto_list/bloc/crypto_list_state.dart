part of 'crypto_list_bloc.dart';

@immutable
sealed class CryptoListState extends Equatable {}

final class CryptoListInitial extends CryptoListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class CryptoListLoading extends CryptoListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CryptoListSuccess extends CryptoListState {
  final List<CryptoCoin> coinsList;

  CryptoListSuccess({required this.coinsList});
  
  @override
  // TODO: implement props
  List<Object?> get props => [coinsList];
}

final class CryptoListLoadingFailure extends CryptoListState {
  final Object? exception;

  CryptoListLoadingFailure({required this.exception});
  
  @override
  // TODO: implement props
  List<Object?> get props => [exception];
}