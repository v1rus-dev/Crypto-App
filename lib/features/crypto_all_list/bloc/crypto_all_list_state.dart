part of 'crypto_all_list_bloc.dart';

@immutable
sealed class CryptoAllListState extends Equatable {}

final class CryptoAllListInitial extends CryptoAllListState {
  @override
  List<Object?> get props => [];
}

final class CryptoAllListLoading extends CryptoAllListState {
  @override
  List<Object?> get props => [];
}

final class CryptoAllListErrorLoading extends CryptoAllListState {
  final Object? e;

  CryptoAllListErrorLoading(this.e);

  @override
  List<Object?> get props => [e];
}

final class CryptoAllListLoadingSuccess extends CryptoAllListState {
  final List<CryptoCoin> list;

  CryptoAllListLoadingSuccess({required this.list});

  @override
  List<Object?> get props => [list];
}
