import 'package:freezed_annotation/freezed_annotation.dart';

part 'complaint_model.g.dart';

@JsonSerializable()
class ComplaintModel {
  final String complaint;
  final String customer;
  final String branch;

  ComplaintModel(this.customer, this.branch, this.complaint);

  factory ComplaintModel.fromJson(Map<String, dynamic> json) =>
      _$ComplaintModelFromJson(json);
  Map<String, dynamic> toJson() => _$ComplaintModelToJson(this);
}
