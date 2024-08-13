import 'package:hello_world/core/network/api_service.dart';

import '../../../utils/app_url.dart';
import '../../models/base_model.dart';

class MerchantRemoteDataSource {
  final ApiServices _apiServices;
  MerchantRemoteDataSource(this._apiServices);
  Future<BaseModel> merchantById() async {
    final response = await _apiServices.get(AppUrl.storeById);
    return BaseModel.fromJson(
      response['data'],
      (itemJson) => BaseModel.fromJson,
    );
  }

  Future<BaseModel> listMerchantBranches() async {
    final response = await _apiServices.get(AppUrl.listMerchantBranches);
    return BaseModel.fromJson(
      response['data'],
      (itemJson) => BaseModel.fromJson,
    );
  }

  Future<BaseModel> getAllMerchants() async {
    final response = await _apiServices.get(AppUrl.getAllMerchants);
    return BaseModel.fromJson(
      response['data'],
      (itemJson) => BaseModel.fromJson,
    );
  }

  Future<BaseModel> listMerchantStores() async {
    final response = await _apiServices.get(AppUrl.listMerchantStores);
    return BaseModel.fromJson(
      response['data'],
      (itemJson) => BaseModel.fromJson,
    );
  }
}
