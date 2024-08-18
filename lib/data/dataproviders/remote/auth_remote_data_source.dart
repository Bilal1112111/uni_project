import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:hello_world/core/helpers/dio_helper.dart';
import 'package:hello_world/core/interceptors/token_interceptor.dart';
import 'package:hello_world/core/network/api_service.dart';
import 'package:hello_world/data/dataproviders/local/shared_preferences.dart';
import 'package:hello_world/data/models/user_model.dart';
import 'package:hello_world/utils/app_url.dart';

import '../../models/base_model.dart';

class AuthRemoteDataSource {
  final ApiServices _apiServices;
  AuthRemoteDataSource(this._apiServices);
  Future<BaseModel<UserModel>> register({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String role,
    required String password,
    required String confirmPassword,
    Uint8List? image,
    String? imageName,
  }) async {
    final response = await _apiServices.post(
      AppUrl.register,
      formData: FormData.fromMap({
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
        "phone_number": phoneNumber,
        "role": role,
        'image': image != null
            ? MultipartFile.fromBytes(image, filename: imageName)
            : null,
      }),
    );
    return BaseModel.fromJson(
        response, (json) => UserModel.fromJson(json['user']));
  }

  Future<BaseModel<UserModel>> login(
      {required String email,
      required String password,
      required String deviceId,
      required String deviceName,
      required String notificationToken}) async {
    final response = await _apiServices.post(
      AppUrl.login,
      formData: FormData.fromMap(
        {
          'email': email,
          'password': password,
          'device_name': deviceName,
          'device_id': deviceId,
          'notification_token': notificationToken,
        },
      ),
    );
    SharedPreference.saveData(
        key: 'access_token', value: response['data']['access_token']);
    DioHelper()
        .dio
        .interceptors
        .add(TokenInterceptor(response['data']['access_token']));
    return BaseModel.fromJson(
        response, (json) => UserModel.fromJson(json['user']));
  }

  Future<BaseModel<UserModel>> verifyEmail({
    required String email,
    required String code,
    required String deviceName,
    required String deviceId,
    required String notificationToken,
  }) async {
    final response = await _apiServices.post(
      AppUrl.verifyEmail,
      formData: FormData.fromMap(
        {
          'email': email,
          'code': code,
          'device_name': deviceName,
          'device_id': deviceId,
          'notification_token': notificationToken,
        },
      ),
    );
    SharedPreference.saveData(
        key: 'access_token', value: response['data']['access_token']);
    DioHelper()
        .dio
        .interceptors
        .add(TokenInterceptor(response['data']['access_token']));
    return BaseModel.fromJson(
        response['data']['user'], (json) => UserModel.fromJson(json));
  }

  Future<BaseModel<UserModel>> resendVerifyEmailCode(
      {required String email}) async {
    final response = await _apiServices.post(
      AppUrl.resendVerifyEmailCode,
      formData: FormData.fromMap(
        {
          'email': email,
        },
      ),
    );
    return BaseModel<UserModel>.fromJson(
        response['data']['user'], (json) => UserModel.fromJson(json));
  }

  Future<BaseModel<UserModel>> forgetPassword({
    required String email,
  }) async {
    final response = await _apiServices.post(
      AppUrl.forgetPassword,
      formData: FormData.fromMap({
        'email': email,
      }),
    );
    return BaseModel<UserModel>.fromJson(
      response['data']['user'],
      (json) => UserModel.fromJson(json),
    );
  }

  Future<BaseModel<UserModel>> forgetPasswordCode({
    required String email,
    required String code,
    required String deviceName,
    required String deviceId,
    required String notificationToken,
  }) async {
    final response = await _apiServices.post(
      AppUrl.forgetPasswordCode,
      formData: FormData.fromMap({
        'email': email,
        'code': code,
        'device_name': deviceName,
        'device_id': deviceId,
        'notification_token': notificationToken,
      }),
    );
    return BaseModel<UserModel>.fromJson(
      response['data']['user'],
      (json) => UserModel.fromJson(json),
    );
  }

  Future<BaseModel<UserModel>> resendForgetPasswordVerifyCode(
      {required String email}) async {
    final response = await _apiServices.post(
      AppUrl.resendForgetPasswordVerifyCode,
      formData: FormData.fromMap(
        {
          'email': email,
        },
      ),
    );
    return BaseModel<UserModel>.fromJson(
      response['data']['user'],
      (json) => UserModel.fromJson(json),
    );
  }

  Future<BaseModel<UserModel>> forgetPasswordChange(
      {required String email, required String newPassword}) async {
    final response = await _apiServices.post(
      AppUrl.forgetPasswordChange,
      formData: FormData.fromMap(
        {
          'email': email,
          'password': newPassword,
        },
      ),
    );
    return BaseModel<UserModel>.fromJson(
      response['data']['user'],
      (json) => UserModel.fromJson(json),
    );
  }

  Future<BaseModel<UserModel>> changePassword(
      {required String deviceId,
      required String currPassword,
      required String newPassword}) async {
    final response = await _apiServices.post(
      AppUrl.changePassword,
      formData: FormData.fromMap(
        {
          'device_id': deviceId,
          'current_password': currPassword,
          'new_password': newPassword
        },
      ),
    );
    return BaseModel<UserModel>.fromJson(
      response['data']['user'],
      (json) => UserModel.fromJson(json),
    );
  }

  Future<BaseModel<UserModel>> logOut({required String deviceId}) async {
    final response = await _apiServices.post(
      AppUrl.logOut,
      formData: FormData.fromMap({
        'device_id': deviceId,
      }),
    );
    return BaseModel<UserModel>.fromJson(
      response,
      (json) => UserModel.fromJson(json),
    );
  }

  Future<BaseModel<UserModel>> restoreAccount(
      {required String email, required String password}) async {
    final response = await _apiServices.post(
      AppUrl.restoreAccount,
      formData: FormData.fromMap(
        {
          'email': email,
          'password': password,
        },
      ),
    );
    return BaseModel.fromJson(response, (json) => UserModel.fromJson(json));
  }
}
