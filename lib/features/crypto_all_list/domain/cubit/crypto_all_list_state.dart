part of 'crypto_all_list_cubit.dart';

final class CryptoAllListState extends Equatable {
  CryptoAllListState({required this.isLoading, required this.list});

  bool isLoading = false;
  List<CryptoCoin> list = [];

  @override
  List<Object?> get props => [isLoading, list];
  CryptoAllListState copyWith({bool? isLoading, List<CryptoCoin>? list}) {
    return CryptoAllListState(
        isLoading: isLoading ?? this.isLoading, list: list ?? this.list);
  }
}
