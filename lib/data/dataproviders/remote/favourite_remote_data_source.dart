import 'package:dio/dio.dart';
import 'package:hello_world/core/network/api_service.dart';
import 'package:hello_world/data/models/favourite_model.dart';
import 'package:hello_world/utils/app_url.dart';

import '../../models/base_model.dart';

class FavouriteRemoteDataSource {
  final ApiServices _apiServices;
  FavouriteRemoteDataSource(this._apiServices);

  Future<BaseModel> addFavourite({required int branchId}) async {
    final response = await _apiServices.post(
      AppUrl.addFavourite,
      formData: FormData.fromMap({
        'branch_id': branchId,
      }),
    );
    return BaseModel.fromJson(
      response,
      (json) =>
          BaseModels.fromJson(json, (itemJson) => FavouriteModel.fromJson),
    );
  }

  Future<BaseModel> listFavourite() async {
    final response = await _apiServices.get(
      AppUrl.listFavourite,
    );
    return BaseModel.fromJson(
      response,
      (json) =>
          BaseModels.fromJson(json, (itemJson) => FavouriteModel.fromJson),
    );
  }
}
