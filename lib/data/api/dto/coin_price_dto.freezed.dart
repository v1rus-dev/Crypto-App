// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_price_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CoinPriceDto {
  String get coinName => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  /// Create a copy of CoinPriceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoinPriceDtoCopyWith<CoinPriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinPriceDtoCopyWith<$Res> {
  factory $CoinPriceDtoCopyWith(
          CoinPriceDto value, $Res Function(CoinPriceDto) then) =
      _$CoinPriceDtoCopyWithImpl<$Res, CoinPriceDto>;
  @useResult
  $Res call({String coinName, double price});
}

/// @nodoc
class _$CoinPriceDtoCopyWithImpl<$Res, $Val extends CoinPriceDto>
    implements $CoinPriceDtoCopyWith<$Res> {
  _$CoinPriceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoinPriceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coinName = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      coinName: null == coinName
          ? _value.coinName
          : coinName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoinPriceDtoImplCopyWith<$Res>
    implements $CoinPriceDtoCopyWith<$Res> {
  factory _$$CoinPriceDtoImplCopyWith(
          _$CoinPriceDtoImpl value, $Res Function(_$CoinPriceDtoImpl) then) =
      __$$CoinPriceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String coinName, double price});
}

/// @nodoc
class __$$CoinPriceDtoImplCopyWithImpl<$Res>
    extends _$CoinPriceDtoCopyWithImpl<$Res, _$CoinPriceDtoImpl>
    implements _$$CoinPriceDtoImplCopyWith<$Res> {
  __$$CoinPriceDtoImplCopyWithImpl(
      _$CoinPriceDtoImpl _value, $Res Function(_$CoinPriceDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoinPriceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coinName = null,
    Object? price = null,
  }) {
    return _then(_$CoinPriceDtoImpl(
      coinName: null == coinName
          ? _value.coinName
          : coinName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$CoinPriceDtoImpl implements _CoinPriceDto {
  _$CoinPriceDtoImpl({required this.coinName, required this.price});

  @override
  final String coinName;
  @override
  final double price;

  @override
  String toString() {
    return 'CoinPriceDto(coinName: $coinName, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinPriceDtoImpl &&
            (identical(other.coinName, coinName) ||
                other.coinName == coinName) &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(runtimeType, coinName, price);

  /// Create a copy of CoinPriceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinPriceDtoImplCopyWith<_$CoinPriceDtoImpl> get copyWith =>
      __$$CoinPriceDtoImplCopyWithImpl<_$CoinPriceDtoImpl>(this, _$identity);
}

abstract class _CoinPriceDto implements CoinPriceDto {
  factory _CoinPriceDto(
      {required final String coinName,
      required final double price}) = _$CoinPriceDtoImpl;

  @override
  String get coinName;
  @override
  double get price;

  /// Create a copy of CoinPriceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoinPriceDtoImplCopyWith<_$CoinPriceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
