part of 'crypto_list_bloc.dart';

@immutable
sealed class CryptoListEvent extends Equatable {}

final class LoadCryptoList extends CryptoListEvent {
  final Completer? complerer;

  LoadCryptoList({this.complerer});

  @override
  List<Object?> get props => [complerer];
}
