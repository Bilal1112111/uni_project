// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: (json['id'] as num).toInt(),
      category: json['category'] as String,
      parentCategoryId: json['parent_category_id'] as String?,
      parentCategoryName: json['parent_category_name'] as String?,
      priority: (json['priority'] as num).toInt(),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'parent_category_id': instance.parentCategoryId,
      'parent_category_name': instance.parentCategoryName,
      'priority': instance.priority,
    };
