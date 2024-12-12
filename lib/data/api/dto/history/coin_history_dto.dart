import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_history_dto.g.dart';

@JsonSerializable(createToJson: false)
class CoinHistoryDTO extends Equatable {
  @JsonKey(name: 'time')
  final int time;
  @JsonKey(name: 'high')
  final double high;
  @JsonKey(name: 'low')
  final double low;

  const CoinHistoryDTO(
      {required this.time, required this.high, required this.low});

  factory CoinHistoryDTO.fromJson(Map<String, dynamic> json) =>
      _$CoinHistoryDTOFromJson(json);

  @override
  List<Object?> get props => [time, high, low];
}
