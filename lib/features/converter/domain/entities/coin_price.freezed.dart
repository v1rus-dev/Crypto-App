// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CoinPrice {
  String get coinName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;

  /// Create a copy of CoinPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoinPriceCopyWith<CoinPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinPriceCopyWith<$Res> {
  factory $CoinPriceCopyWith(CoinPrice value, $Res Function(CoinPrice) then) =
      _$CoinPriceCopyWithImpl<$Res, CoinPrice>;
  @useResult
  $Res call({String coinName, String name, String price});
}

/// @nodoc
class _$CoinPriceCopyWithImpl<$Res, $Val extends CoinPrice>
    implements $CoinPriceCopyWith<$Res> {
  _$CoinPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoinPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coinName = null,
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      coinName: null == coinName
          ? _value.coinName
          : coinName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoinPriceImplCopyWith<$Res>
    implements $CoinPriceCopyWith<$Res> {
  factory _$$CoinPriceImplCopyWith(
          _$CoinPriceImpl value, $Res Function(_$CoinPriceImpl) then) =
      __$$CoinPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String coinName, String name, String price});
}

/// @nodoc
class __$$CoinPriceImplCopyWithImpl<$Res>
    extends _$CoinPriceCopyWithImpl<$Res, _$CoinPriceImpl>
    implements _$$CoinPriceImplCopyWith<$Res> {
  __$$CoinPriceImplCopyWithImpl(
      _$CoinPriceImpl _value, $Res Function(_$CoinPriceImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoinPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coinName = null,
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_$CoinPriceImpl(
      coinName: null == coinName
          ? _value.coinName
          : coinName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CoinPriceImpl implements _CoinPrice {
  const _$CoinPriceImpl(
      {required this.coinName, required this.name, required this.price});

  @override
  final String coinName;
  @override
  final String name;
  @override
  final String price;

  @override
  String toString() {
    return 'CoinPrice(coinName: $coinName, name: $name, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinPriceImpl &&
            (identical(other.coinName, coinName) ||
                other.coinName == coinName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(runtimeType, coinName, name, price);

  /// Create a copy of CoinPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinPriceImplCopyWith<_$CoinPriceImpl> get copyWith =>
      __$$CoinPriceImplCopyWithImpl<_$CoinPriceImpl>(this, _$identity);
}

abstract class _CoinPrice implements CoinPrice {
  const factory _CoinPrice(
      {required final String coinName,
      required final String name,
      required final String price}) = _$CoinPriceImpl;

  @override
  String get coinName;
  @override
  String get name;
  @override
  String get price;

  /// Create a copy of CoinPrice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoinPriceImplCopyWith<_$CoinPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
