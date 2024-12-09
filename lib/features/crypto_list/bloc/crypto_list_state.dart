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

  CryptoListSuccess();
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class CryptoListLoadingFailure extends CryptoListState {
  final Object? exception;

  CryptoListLoadingFailure({required this.exception});
  
  @override
  // TODO: implement props
  List<Object?> get props => [exception];
}