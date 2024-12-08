import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_history_entity.g.dart';

@JsonSerializable(createToJson: false)
class CoinHistoryEntity extends Equatable {
  @JsonKey(name: 'time')
  final int time;
  @JsonKey(name: 'high')
  final double high;
  @JsonKey(name: 'low')
  final double low;

  const CoinHistoryEntity(
      {required this.time, required this.high, required this.low});

  factory CoinHistoryEntity.fromJson(Map<String, dynamic> json) =>
      _$CoinHistoryEntityFromJson(json);

  @override
  List<Object?> get props => [time, high, low];
}
