import 'package:freezed_annotation/freezed_annotation.dart';

part 'advertisement_model.g.dart';

@JsonSerializable()
class AdvertisementModel {
  final int id;
  final String description;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String period;
  final String user;
  final String? price;
  final int shown;
  final String status;
  final String image;
  @JsonKey(name: 'accepted_at')
  final String? acceptedAt;

  AdvertisementModel(
    this.description,
    this.id,
    this.phoneNumber,
    this.acceptedAt,
    this.image,
    this.period,
    this.price,
    this.shown,
    this.status,
    this.user,
  );
  factory AdvertisementModel.fromJson(Map<String, dynamic> json) =>
      _$AdvertisementModelFromJson(json);
  Map<String, dynamic> toJson() => _$AdvertisementModelToJson(this);
}
