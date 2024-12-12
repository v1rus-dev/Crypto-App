import 'package:equatable/equatable.dart';

class CoinHistoryInfo extends Equatable {
  final int time;
  final double high;
  final double low;

  const CoinHistoryInfo(
      {required this.time, required this.high, required this.low});

  @override
  List<Object?> get props => [time, high, low];
}
