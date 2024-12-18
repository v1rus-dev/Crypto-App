import 'package:equatable/equatable.dart';

sealed class LoadCoinsPriceFor extends Equatable {}

final class LoadCoinsPriceInitial extends LoadCoinsPriceFor {
  @override
  List<Object?> get props => [];
}

final class LoadCoinsPriceFrom extends LoadCoinsPriceFor {
  @override
  List<Object?> get props => [];
}

final class LoadCoinsPriceTo extends LoadCoinsPriceFor {
  @override
  List<Object?> get props => [];
}