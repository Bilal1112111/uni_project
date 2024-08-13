import 'dart:typed_data';

import 'package:hello_world/core/network/error_handler/network_exception.dart';
import 'package:hello_world/data/dataproviders/remote/auth_remote_data_source.dart';

import '../../core/network/api_response.dart';
import '../models/base_model.dart';

class AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRepository(this._authRemoteDataSource);

  Future<ApiResponse<BaseModel>> register(
      {required String firstName,
      required String lastName,
      required String phoneNumber,
      required String email,
      required String role,
      required String password,
      required String confirmPassword,
      Uint8List? image,
      String? imageName}) async {
    try {
      final response = await _authRemoteDataSource.register(
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          email: email,
          role: role,
          password: password,
          confirmPassword: confirmPassword,
          image: image,
          imageName: imageName);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> login({
    required String email,
    required String password,
    required String deviceId,
    required String deviceName,
    required String notificationToken,
  }) async {
    try {
      final response = await _authRemoteDataSource.login(
          email: email,
          password: password,
          deviceId: deviceId,
          deviceName: deviceName,
          notificationToken: notificationToken);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> verifyEmail({
    required String email,
    required String code,
    required String deviceName,
    required String deviceId,
    required String notificationToken,
  }) async {
    try {
      final response = await _authRemoteDataSource.verifyEmail(
          email: email,
          code: code,
          deviceName: deviceName,
          deviceId: deviceId,
          notificationToken: notificationToken);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> resendVerifyEmail(
      {required String email}) async {
    try {
      final response =
          await _authRemoteDataSource.resendVerifyEmailCode(email: email);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> forgetPassword({required String email}) async {
    try {
      final response = await _authRemoteDataSource.forgetPassword(email: email);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> forgetPasswordCode(
      {required String email,
      required String deviceName,
      required String deviceId,
      required String notificationToken,
      required String code}) async {
    try {
      final response = await _authRemoteDataSource.forgetPasswordCode(
          email: email,
          deviceName: deviceName,
          deviceId: deviceId,
          notificationToken: notificationToken,
          code: code);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> resendForgetPasswordVerifyCode(
      {required String email}) async {
    try {
      final response = await _authRemoteDataSource
          .resendForgetPasswordVerifyCode(email: email);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> forgetPasswordChange(
      {required String email, required String newPassword}) async {
    try {
      final response = await _authRemoteDataSource.forgetPasswordChange(
          email: email, newPassword: newPassword);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> changePassword(
      {required String deviceId,
      required String currPassword,
      required String newPassword}) async {
    try {
      final response = await _authRemoteDataSource.changePassword(
        deviceId: deviceId,
        currPassword: currPassword,
        newPassword: newPassword,
      );
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> logOut({required String deviceId}) async {
    try {
      final response = await _authRemoteDataSource.logOut(deviceId: deviceId);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> restoreAccount(
      {required String email, required String password}) async {
    try {
      final response = await _authRemoteDataSource.restoreAccount(
          email: email, password: password);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }
}
