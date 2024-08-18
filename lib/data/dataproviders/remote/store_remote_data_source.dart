import 'package:dio/dio.dart';
import 'package:hello_world/core/network/api_service.dart';
import 'package:hello_world/utils/app_url.dart';

import '../../models/base_model.dart';
import '../../models/branch_model.dart';
import '../../models/complaint_model.dart';

class StoreRemoteDataSource {
  final ApiServices _apiServices;
  StoreRemoteDataSource(this._apiServices);
  //
  // Future<BaseModel> storeById({required int id}) async {
  //   final response = await _apiServices.post(
  //     AppUrl.storeById,
  //     formData: FormData.fromMap(
  //       {
  //         'merchant_id': id,
  //       },
  //     ),
  //   );
  //   return BaseModel.fromJson(
  //     response['data'],
  //     (itemJson) => BaseModel.fromJson,
  //   );
  // }
  //
  // Future<BaseModel> listVisibleStores() async {
  //   final response = await _apiServices.get(
  //     AppUrl.listVisibleStores,
  //   );
  //   return BaseModel.fromJson(
  //     response,
  //     (json) => BaseModels.fromJson(
  //       json,
  //       (itemJson) => StoreModel.fromJson(itemJson),
  //     ),
  //   );
  // }

  Future<BaseModel> branchById({required String id}) async {
    final response = await _apiServices.get(
      AppUrl.branchById,
      queryParams: {'id': id},
    );
    return BaseModel.fromJson(
      response,
      (json) => BaseModels.fromJson(
        json,
        (itemJson) => BranchModel.fromJson(itemJson),
      ),
    );
  }

  Future<BaseModel> listCustomerBranches() async {
    final response = await _apiServices.get(
      AppUrl.listCustomerBranches,
    );
    return BaseModel.fromJson(
      response,
      (json) => BaseModels.fromJson(
        json,
        (itemJson) => BranchModel.fromJson(itemJson),
      ),
    );
  }

  Future<BaseModel> addComplaint(
      {required String complaint, required int branchId}) async {
    final response = await _apiServices.post(
      AppUrl.addComplaint,
      formData: FormData.fromMap(
        {
          'complaint': complaint,
          'branch_id': branchId,
        },
      ),
    );
    return BaseModel.fromJson(
      response,
      (json) =>
          BaseModels.fromJson(json, (itemJson) => ComplaintModel.fromJson),
    );
  }

  //
  // Future<BaseModel> showStoreById({required String storeId}) async {
  //   final response = await _apiServices.get(
  //     AppUrl.showStoreById,
  //     queryParams: {
  //       'store_id': storeId,
  //     },
  //   );
  //   return BaseModel.fromJson(
  //     response,
  //     (json) => BaseModels.fromJson(json, (itemJson) => StoreModel.fromJson),
  //   );
  // }
  Future<BaseModel> addRate(
      {required String rate, required int branchId}) async {
    final response = await _apiServices.post(
      AppUrl.addRate,
      formData: FormData.fromMap(
        {
          'branch_id': branchId,
          'rate': rate,
        },
      ),
    );
    return BaseModel.fromJson(
      response,
      (itemJson) => BaseModel.fromJson,
    );
  }
}
