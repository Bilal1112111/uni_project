import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel {
  @JsonKey(name: 'customer_id')
  final String customerId;
  final String comment;
  CommentModel(this.comment, this.customerId);
  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}
