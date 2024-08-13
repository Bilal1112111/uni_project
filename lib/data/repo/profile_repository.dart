import 'package:hello_world/core/network/error_handler/network_exception.dart';
import 'package:hello_world/data/dataproviders/remote/profile_remote_data_source.dart';
import 'package:hello_world/data/models/base_model.dart';

import '../../core/network/api_response.dart';

class ProfileRepository {
  final ProfileRemoteDataSource _profileRemoteDataSource;
  ProfileRepository(this._profileRemoteDataSource);
  Future<ApiResponse<BaseModel>> getProfile() async {
    try {
      final response = await _profileRemoteDataSource.getProfile();
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> updateProfile(
      {String? firstName,
      String? lastName,
      String? phone,
      String? image}) async {
    try {
      final response = await _profileRemoteDataSource.updateProfile(
          firstName: firstName, lastName: lastName, phone: phone, image: image);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> softAccountDelete() async {
    try {
      final response = await _profileRemoteDataSource.softAccountDelete();
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> hardAccountDelete() async {
    try {
      final response = await _profileRemoteDataSource.hardAccountDelete();
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }
}
