import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_model.g.dart';

@JsonSerializable()
class BranchModel {
  final int? id;
  final String? name;
  final String? location;
  @JsonKey(name: 'google_maps')
  final String? googleMaps;
  final int? visible;
  final String? store;
  final String? category;
  final String? image;
  final int? rate;
  final List<NumberModel>? numbers;
  final List<QrModel>? qr;

  BranchModel(
      this.image,
      this.name,
      this.id,
      this.visible,
      this.category,
      this.googleMaps,
      this.location,
      this.numbers,
      this.qr,
      this.rate,
      this.store);
  factory BranchModel.fromJson(Map<String, dynamic> json) =>
      _$BranchModelFromJson(json);
  Map<String, dynamic> toJson() => _$BranchModelToJson(this);
}

@JsonSerializable()
class QrModel {
  final String? image;
  final int? rate;

  QrModel(this.rate, this.image);
  factory QrModel.fromJson(Map<String, dynamic> json) =>
      _$QrModelFromJson(json);
  Map<String, dynamic> toJson() => _$QrModelToJson(this);
}

@JsonSerializable()
class NumberModel {
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  final int id;

  NumberModel(this.id, this.phoneNumber);
  factory NumberModel.fromJson(Map<String, dynamic> json) =>
      _$NumberModelFromJson(json);
  Map<String, dynamic> toJson() => _$NumberModelToJson(this);
}
