// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CoinInfo {
  String get name => throw _privateConstructorUsedError;
  String get coinName => throw _privateConstructorUsedError;

  /// Create a copy of CoinInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoinInfoCopyWith<CoinInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinInfoCopyWith<$Res> {
  factory $CoinInfoCopyWith(CoinInfo value, $Res Function(CoinInfo) then) =
      _$CoinInfoCopyWithImpl<$Res, CoinInfo>;
  @useResult
  $Res call({String name, String coinName});
}

/// @nodoc
class _$CoinInfoCopyWithImpl<$Res, $Val extends CoinInfo>
    implements $CoinInfoCopyWith<$Res> {
  _$CoinInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoinInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? coinName = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      coinName: null == coinName
          ? _value.coinName
          : coinName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoinInfoImplCopyWith<$Res>
    implements $CoinInfoCopyWith<$Res> {
  factory _$$CoinInfoImplCopyWith(
          _$CoinInfoImpl value, $Res Function(_$CoinInfoImpl) then) =
      __$$CoinInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String coinName});
}

/// @nodoc
class __$$CoinInfoImplCopyWithImpl<$Res>
    extends _$CoinInfoCopyWithImpl<$Res, _$CoinInfoImpl>
    implements _$$CoinInfoImplCopyWith<$Res> {
  __$$CoinInfoImplCopyWithImpl(
      _$CoinInfoImpl _value, $Res Function(_$CoinInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoinInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? coinName = null,
  }) {
    return _then(_$CoinInfoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      coinName: null == coinName
          ? _value.coinName
          : coinName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CoinInfoImpl implements _CoinInfo {
  const _$CoinInfoImpl({required this.name, required this.coinName});

  @override
  final String name;
  @override
  final String coinName;

  @override
  String toString() {
    return 'CoinInfo(name: $name, coinName: $coinName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.coinName, coinName) ||
                other.coinName == coinName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, coinName);

  /// Create a copy of CoinInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinInfoImplCopyWith<_$CoinInfoImpl> get copyWith =>
      __$$CoinInfoImplCopyWithImpl<_$CoinInfoImpl>(this, _$identity);
}

abstract class _CoinInfo implements CoinInfo {
  const factory _CoinInfo(
      {required final String name,
      required final String coinName}) = _$CoinInfoImpl;

  @override
  String get name;
  @override
  String get coinName;

  /// Create a copy of CoinInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoinInfoImplCopyWith<_$CoinInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
