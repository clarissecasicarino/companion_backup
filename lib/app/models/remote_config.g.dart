// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RemoteConfig _$$_RemoteConfigFromJson(Map<String, dynamic> json) =>
    _$_RemoteConfig(
      forceUpdateVersion: json['forceUpdateVersion'] as num,
      maintenance: json['maintenance'] as bool,
      tncVersion: json['tncVersion'] as num,
    );

Map<String, dynamic> _$$_RemoteConfigToJson(_$_RemoteConfig instance) =>
    <String, dynamic>{
      'forceUpdateVersion': instance.forceUpdateVersion,
      'maintenance': instance.maintenance,
      'tncVersion': instance.tncVersion,
    };
