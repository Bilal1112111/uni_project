// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['description'] as String,
      json['merchant'] as String,
      (json['merchant_id'] as num).toInt(),
      (json['verified'] as num).toInt(),
      (json['visible'] as num).toInt(),
    );

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'visible': instance.visible,
      'verified': instance.verified,
      'merchant_id': instance.merchantId,
      'merchant': instance.merchant,
    };
