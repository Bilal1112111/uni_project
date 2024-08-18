// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchModel _$BranchModelFromJson(Map<String, dynamic> json) => BranchModel(
      json['image'] as String?,
      json['name'] as String?,
      (json['id'] as num?)?.toInt(),
      (json['visible'] as num?)?.toInt(),
      json['category'] as String?,
      json['google_maps'] as String?,
      json['location'] as String?,
      (json['numbers'] as List<dynamic>?)
          ?.map((e) => NumberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['qr'] as List<dynamic>?)
          ?.map((e) => QrModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['rate'] as num?)?.toInt(),
      json['store'] as String?,
    );

Map<String, dynamic> _$BranchModelToJson(BranchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'google_maps': instance.googleMaps,
      'visible': instance.visible,
      'store': instance.store,
      'category': instance.category,
      'image': instance.image,
      'rate': instance.rate,
      'numbers': instance.numbers,
      'qr': instance.qr,
    };

QrModel _$QrModelFromJson(Map<String, dynamic> json) => QrModel(
      (json['rate'] as num?)?.toInt(),
      json['image'] as String?,
    );

Map<String, dynamic> _$QrModelToJson(QrModel instance) => <String, dynamic>{
      'image': instance.image,
      'rate': instance.rate,
    };

NumberModel _$NumberModelFromJson(Map<String, dynamic> json) => NumberModel(
      (json['id'] as num).toInt(),
      json['phone_number'] as String?,
    );

Map<String, dynamic> _$NumberModelToJson(NumberModel instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'id': instance.id,
    };
