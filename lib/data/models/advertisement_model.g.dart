// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertisement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvertisementModel _$AdvertisementModelFromJson(Map<String, dynamic> json) =>
    AdvertisementModel(
      json['description'] as String,
      (json['id'] as num).toInt(),
      json['phone_number'] as String,
      json['accepted_at'] as String?,
      json['image'] as String,
      json['period'] as String,
      json['price'] as String?,
      (json['shown'] as num).toInt(),
      json['status'] as String,
      json['user'] as String,
    );

Map<String, dynamic> _$AdvertisementModelToJson(AdvertisementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'phone_number': instance.phoneNumber,
      'period': instance.period,
      'user': instance.user,
      'price': instance.price,
      'shown': instance.shown,
      'status': instance.status,
      'image': instance.image,
      'accepted_at': instance.acceptedAt,
    };
