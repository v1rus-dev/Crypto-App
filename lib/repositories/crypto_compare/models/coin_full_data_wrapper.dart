import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_full_data_wrapper.g.dart';

@JsonSerializable(createToJson: false)
class CoinFullDataWrapper extends Equatable {
  @JsonKey(name: 'Raw')
  final Map<String, dynamic> raw;

  const CoinFullDataWrapper({required this.raw});

  factory CoinFullDataWrapper.fromJson(Map<String, dynamic> json) => _$CoinFullDataWrapperFromJson(json);

  @override
  List<Object?> get props => [raw];
}
