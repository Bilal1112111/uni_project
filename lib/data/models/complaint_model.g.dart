// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplaintModel _$ComplaintModelFromJson(Map<String, dynamic> json) =>
    ComplaintModel(
      json['customer'] as String,
      json['branch'] as String,
      json['complaint'] as String,
    );

Map<String, dynamic> _$ComplaintModelToJson(ComplaintModel instance) =>
    <String, dynamic>{
      'complaint': instance.complaint,
      'customer': instance.customer,
      'branch': instance.branch,
    };
