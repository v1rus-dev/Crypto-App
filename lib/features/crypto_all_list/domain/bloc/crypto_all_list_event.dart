part of 'crypto_all_list_bloc.dart';

@immutable
sealed class CryptoAllListEvent extends Equatable {}

final class CryptoAllListInitialEvent extends CryptoAllListEvent {
  @override
  List<Object?> get props => [];
}

final class CryptoAllListLoadAllListEvent extends CryptoAllListEvent {
  final Completer? completer;

  CryptoAllListLoadAllListEvent({this.completer});

  @override
  List<Object?> get props => [completer];
}

final class CryptoAllListUpdateSearchEvent extends CryptoAllListEvent {
  final String search;

  CryptoAllListUpdateSearchEvent({required this.search});

  @override
  List<Object?> get props => [search];
}
