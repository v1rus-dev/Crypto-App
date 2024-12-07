part of 'crypto_all_list_bloc.dart';

// ignore: must_be_immutable
class CryptoAllListState extends Equatable {
  bool isLoading = false;
  List<CryptoCoin> list = [];

  CryptoAllListState({required this.isLoading, required this.list});

  setLoadingState(bool newState) {
    isLoading = newState;
  }

  setList(List<CryptoCoin> newList) {
    list = newList;
  }

  @override
  List<Object?> get props => [isLoading, list];

  CryptoAllListState copyWith({bool? isLoading = null, List<CryptoCoin>? list = null}) {
    return CryptoAllListState(
        isLoading: isLoading ?? this.isLoading, list: list ?? this.list);
  }
}

// final class CryptoAllListInitial extends CryptoAllListState {
//   @override
//   List<Object?> get props => [];
// }

// final class CryptoAllListLoading extends CryptoAllListState {
//   @override
//   List<Object?> get props => [];
// }

// final class CryptoAllListErrorLoading extends CryptoAllListState {
//   final Object? e;

//   CryptoAllListErrorLoading(this.e);

//   @override
//   List<Object?> get props => [e];
// }

// final class CryptoAllListLoadingSuccess extends CryptoAllListState {
//   final List<CryptoCoin> list;

//   CryptoAllListLoadingSuccess({required this.list});

//   @override
//   List<Object?> get props => [list];
// }
