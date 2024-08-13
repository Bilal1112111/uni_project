import 'package:dio/dio.dart';
import 'package:hello_world/core/network/api_service.dart';
import 'package:hello_world/utils/app_url.dart';

import '../../models/advertisement_model.dart';
import '../../models/base_model.dart';

class AdvertisementRemoteDataSource {
  final ApiServices _apiServices;
  AdvertisementRemoteDataSource(this._apiServices);

  Future<BaseModel> addAdvertisement(
      {required String description,
      required String phoneNumber,
      required int period,
      required String image}) async {
    final response = await _apiServices.post(
      AppUrl.addAdvertisement,
      formData: FormData.fromMap(
        {
          'description': description,
          'phone_number': phoneNumber,
          'period': period,
          'image': image,
        },
      ),
    );
    return BaseModel.fromJson(
      response,
      (json) => BaseModels.fromJson(
          json, (itemJson) => AdvertisementModel.fromJson(itemJson)),
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
