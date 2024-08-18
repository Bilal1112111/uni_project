import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String email;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  String? image;
  UserModel({
    required this.email,
    required this.firstName,
    required this.id,
    required this.lastName,
    required this.phoneNumber,
    this.image,
  });
  String get fullName => "$firstName $lastName";
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
