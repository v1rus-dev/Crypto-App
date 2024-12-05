part of 'one_coin_details_bloc.dart';

sealed class CryptoCoinState extends Equatable {
  const CryptoCoinState();
}

final class CryptoCoinInitial extends CryptoCoinState {
  @override
  List<Object?> get props => [];
}

final class CryptoCoinLoading extends CryptoCoinState {
  @override
  List<Object?> get props => [];
}

final class CryptoCoinSuccess extends CryptoCoinState {
  const CryptoCoinSuccess({required this.coin, required this.simplePrice});
  final CryptoCoin coin;
  final CryptoSimplePrice simplePrice;

  @override
  List<Object?> get props => [coin, simplePrice];
}
