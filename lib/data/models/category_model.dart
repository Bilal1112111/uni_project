import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final int id;
  final String category;
  @JsonKey(name: 'parent_category_id')
  final String? parentCategoryId;
  @JsonKey(name: 'parent_category_name')
  final String? parentCategoryName;
  final int priority;

  CategoryModel(
      {required this.id,
      required this.category,
      this.parentCategoryId,
      this.parentCategoryName,
      required this.priority});
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
