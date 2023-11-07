// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobModelImpl _$$JobModelImplFromJson(Map<String, dynamic> json) =>
    _$JobModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      ratePerHour: json['ratePerHour'] as int,
    );

Map<String, dynamic> _$$JobModelImplToJson(_$JobModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ratePerHour': instance.ratePerHour,
    };
