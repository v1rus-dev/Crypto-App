import 'package:equatable/equatable.dart';

sealed class ConverterSideType extends Equatable {}

final class Nothing extends ConverterSideType {
  @override
  List<Object?> get props => [];
}

final class FromSide extends ConverterSideType {
  @override
  List<Object?> get props => [];
}

final class ToSide extends ConverterSideType {
  @override
  List<Object?> get props => [];
}
