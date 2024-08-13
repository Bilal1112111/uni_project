import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourite_model.g.dart';

@JsonSerializable()
class FavouriteModel {
  final String branch;
  final String customer;

  FavouriteModel(this.branch, this.customer);

  factory FavouriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavouriteModelFromJson(json);
  Map<String, dynamic> toJson() => _$FavouriteModelToJson(this);
}
