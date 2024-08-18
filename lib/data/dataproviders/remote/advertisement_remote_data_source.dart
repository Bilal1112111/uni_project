import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:hello_world/core/network/api_service.dart';
import 'package:hello_world/utils/app_url.dart';

import '../../models/advertisement_model.dart';
import '../../models/base_model.dart';

class AdvertisementRemoteDataSource {
  final ApiServices _apiServices;
  AdvertisementRemoteDataSource(this._apiServices);

  Future<BaseModel<AdvertisementModel>> addAdvertisement(
      {required String description,
      required String phoneNumber,
      required String period,
      required Uint8List image,
      required String imageName}) async {
    final response = await _apiServices.post(
      AppUrl.addAdvertisement,
      formData: FormData.fromMap({
        'description': description,
        'phone_number': phoneNumber,
        'period': period,
        'image': image != null
            ? MultipartFile.fromBytes(image, filename: imageName)
            : null,
      }),
    );
    return BaseModel.fromJson(
      response,
      (json) => AdvertisementModel.fromJson(json),
    );
  }

  Future<BaseModel> listAdvertisements() async {
    final response = await _apiServices.get(
      AppUrl.listAdvertisement,
    );
    return BaseModel.fromJson(
      response,
      (json) => BaseModels.fromJson(
          json, (itemJson) => AdvertisementModel.fromJson(itemJson)),
    );
  }

  Future<BaseModel> advertisementAcceptedDetails() async {
    final response = await _apiServices.get(
      AppUrl.advertisementAcceptedDetails,
    );
    return BaseModel.fromJson(
      response,
      (json) => BaseModels.fromJson(
          json, (itemJson) => AdvertisementModel.fromJson(itemJson)),
    );
  }
}
