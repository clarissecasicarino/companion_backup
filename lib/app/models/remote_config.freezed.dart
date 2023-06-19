// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RemoteConfig _$RemoteConfigFromJson(Map<String, dynamic> json) {
  return _RemoteConfig.fromJson(json);
}

/// @nodoc
mixin _$RemoteConfig {
  num get forceUpdateVersion => throw _privateConstructorUsedError;
  bool get maintenance => throw _privateConstructorUsedError;
  num get tncVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteConfigCopyWith<RemoteConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteConfigCopyWith<$Res> {
  factory $RemoteConfigCopyWith(
          RemoteConfig value, $Res Function(RemoteConfig) then) =
      _$RemoteConfigCopyWithImpl<$Res, RemoteConfig>;
  @useResult
  $Res call({num forceUpdateVersion, bool maintenance, num tncVersion});
}

/// @nodoc
class _$RemoteConfigCopyWithImpl<$Res, $Val extends RemoteConfig>
    implements $RemoteConfigCopyWith<$Res> {
  _$RemoteConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forceUpdateVersion = null,
    Object? maintenance = null,
    Object? tncVersion = null,
  }) {
    return _then(_value.copyWith(
      forceUpdateVersion: null == forceUpdateVersion
          ? _value.forceUpdateVersion
          : forceUpdateVersion // ignore: cast_nullable_to_non_nullable
              as num,
      maintenance: null == maintenance
          ? _value.maintenance
          : maintenance // ignore: cast_nullable_to_non_nullable
              as bool,
      tncVersion: null == tncVersion
          ? _value.tncVersion
          : tncVersion // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RemoteConfigCopyWith<$Res>
    implements $RemoteConfigCopyWith<$Res> {
  factory _$$_RemoteConfigCopyWith(
          _$_RemoteConfig value, $Res Function(_$_RemoteConfig) then) =
      __$$_RemoteConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num forceUpdateVersion, bool maintenance, num tncVersion});
}

/// @nodoc
class __$$_RemoteConfigCopyWithImpl<$Res>
    extends _$RemoteConfigCopyWithImpl<$Res, _$_RemoteConfig>
    implements _$$_RemoteConfigCopyWith<$Res> {
  __$$_RemoteConfigCopyWithImpl(
      _$_RemoteConfig _value, $Res Function(_$_RemoteConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forceUpdateVersion = null,
    Object? maintenance = null,
    Object? tncVersion = null,
  }) {
    return _then(_$_RemoteConfig(
      forceUpdateVersion: null == forceUpdateVersion
          ? _value.forceUpdateVersion
          : forceUpdateVersion // ignore: cast_nullable_to_non_nullable
              as num,
      maintenance: null == maintenance
          ? _value.maintenance
          : maintenance // ignore: cast_nullable_to_non_nullable
              as bool,
      tncVersion: null == tncVersion
          ? _value.tncVersion
          : tncVersion // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RemoteConfig implements _RemoteConfig {
  _$_RemoteConfig(
      {required this.forceUpdateVersion,
      required this.maintenance,
      required this.tncVersion});

  factory _$_RemoteConfig.fromJson(Map<String, dynamic> json) =>
      _$$_RemoteConfigFromJson(json);

  @override
  final num forceUpdateVersion;
  @override
  final bool maintenance;
  @override
  final num tncVersion;

  @override
  String toString() {
    return 'RemoteConfig(forceUpdateVersion: $forceUpdateVersion, maintenance: $maintenance, tncVersion: $tncVersion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoteConfig &&
            (identical(other.forceUpdateVersion, forceUpdateVersion) ||
                other.forceUpdateVersion == forceUpdateVersion) &&
            (identical(other.maintenance, maintenance) ||
                other.maintenance == maintenance) &&
            (identical(other.tncVersion, tncVersion) ||
                other.tncVersion == tncVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, forceUpdateVersion, maintenance, tncVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoteConfigCopyWith<_$_RemoteConfig> get copyWith =>
      __$$_RemoteConfigCopyWithImpl<_$_RemoteConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RemoteConfigToJson(
      this,
    );
  }
}

abstract class _RemoteConfig implements RemoteConfig {
  factory _RemoteConfig(
      {required final num forceUpdateVersion,
      required final bool maintenance,
      required final num tncVersion}) = _$_RemoteConfig;

  factory _RemoteConfig.fromJson(Map<String, dynamic> json) =
      _$_RemoteConfig.fromJson;

  @override
  num get forceUpdateVersion;
  @override
  bool get maintenance;
  @override
  num get tncVersion;
  @override
  @JsonKey(ignore: true)
  _$$_RemoteConfigCopyWith<_$_RemoteConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
