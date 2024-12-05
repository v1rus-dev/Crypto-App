part of 'crypto_all_list_bloc.dart';

@immutable
sealed class CryptoAllListEvent extends Equatable {}

final class LoadAllList extends CryptoAllListEvent {
  final Completer? completer;

  LoadAllList({this.completer});

  @override
  List<Object?> get props => [completer];
}
