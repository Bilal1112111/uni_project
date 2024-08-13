import 'package:dio/dio.dart';
import 'package:hello_world/core/network/api_service.dart';
import 'package:hello_world/data/models/base_model.dart';
import 'package:hello_world/utils/app_url.dart';

import '../../models/user_model.dart';

class ProfileRemoteDataSource {
  final ApiServices _apiServices;
  ProfileRemoteDataSource(this._apiServices);

  Future<BaseModel<UserModel>> getProfile() async {
    final response = await _apiServices.get(AppUrl.getProfile);
    return BaseModel.fromJson(
      response['data'],
      (itemJson) => UserModel.fromJson(itemJson),
    );
  }

  Future<BaseModel<UserModel>> updateProfile(
      {String? firstName,
      String? lastName,
      String? phone,
      String? image}) async {
    final response = await _apiServices.post(
      AppUrl.updateProfile,
      formData: FormData.fromMap(
        {
          'first_name': firstName,
          'last_name': lastName,
          'phone_number': phone,
          'image': image,
        },
      ),
    );
    return BaseModel.fromJson(
      response['data'],
      (json) => UserModel.fromJson(json),
    );
  }

  Future<BaseModel<UserModel>> softAccountDelete() async {
    final response = await _apiServices.post(AppUrl.accountSoftDelete);
    return BaseModel.fromJson(response, (json) => UserModel.fromJson(json));
  }

  Future<BaseModel<UserModel>> hardAccountDelete() async {
    final response = await _apiServices.post(AppUrl.accountHardDelete);
    return BaseModel.fromJson(
        response['data'], (json) => UserModel.fromJson(json));
  }
}
