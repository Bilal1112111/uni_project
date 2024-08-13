import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_model.g.dart';

@JsonSerializable()
class StoreModel {
  final int id;
  final String name;
  final String description;
  final int visible;
  final int verified;
  @JsonKey(name: 'merchant_id')
  final int merchantId;
  final String merchant;

  StoreModel(this.id, this.name, this.description, this.merchant,
      this.merchantId, this.verified, this.visible);

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);
  Map<String, dynamic> toJson() => _$StoreModelToJson(this);
}
