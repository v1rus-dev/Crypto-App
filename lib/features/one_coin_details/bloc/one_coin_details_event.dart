part of 'one_coin_details_bloc.dart';

sealed class CryptoCoinEvent extends Equatable {
  const CryptoCoinEvent();
}

final class CryptoCoinLoadingData extends CryptoCoinEvent {
  final Completer? completer;
  final String name;

  const CryptoCoinLoadingData({this.completer, required this.name});

  @override
  List<Object?> get props => [name];
}
